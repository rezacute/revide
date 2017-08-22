//
//  RootViewController.swift
//  revide
//
//  Created by syahRiza on 2017/08/22.
//  Copyright © 2017 syahtech. All rights reserved.
//

import UIKit
import Material
import Graph
import ReSwift

class RootViewController: UIViewController, StoreSubscriber {
    // Model.
    internal var graph: Graph!
    internal var search: Search<Entity>!
    
    // View.
    internal var tableView: VideoTableView!

    override func viewWillAppear(_ animated: Bool) {
        mainStore.subscribe(self)
    }

    override func viewWillDisappear(_ animated: Bool) {
        mainStore.unsubscribe(self)
    }

    func newState(state: AppState) {
        reloadData()
        tableView?.reloadData()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.grey.lighten5
        
        // Prepare view.
        prepareSearchBar()
        prepareTableView()
        
        // Prepare model.
        prepareGraph()
        prepareSearch()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView?.reloadData()
    }
}

/// Model.
extension RootViewController {
    internal func prepareGraph() {
        graph = Graph()
        
        // Uncomment to clear the Graph data.
//        graph.clear()
    }
    
    internal func prepareSearch() {
        search = Search<Entity>(graph: graph).for(types: "Video").where(properties: "title")
        
        search.async { [weak self] (data) in
            if 0 == data.count {
                mainStore.dispatch(fetchVideos(state:store:))
            }
            self?.reloadData()
        }
    }
    
    internal func prepareTableView() {
        tableView = VideoTableView()
        view.layout(tableView).edges()
    }
    
    internal func reloadData() {
        var dataSourceItems = [DataSourceItem]()
        
        let videos = search.sync().sorted(by: { (a, b) -> Bool in
            guard let n = a.title , let m = b.title else {
                return false
            }
            
            return n < m
        })
            
        videos.forEach {
            dataSourceItems.append(DataSourceItem(data: $0))
        }
        
        tableView.dataSourceItems = dataSourceItems
    }
}

extension RootViewController: SearchBarDelegate {
    internal func prepareSearchBar() {
        // Access the searchBar.
        guard let searchBar = searchBarController?.searchBar else {
            return
        }
        
        searchBar.delegate = self
    }
    
    func searchBar(searchBar: SearchBar, didClear textField: UITextField, with text: String?) {
        reloadData()
    }
    
    func searchBar(searchBar: SearchBar, didChange textField: UITextField, with text: String?) {
        guard let pattern = text?.trimmed, 0 < pattern.utf16.count else {
            reloadData()
            return
        }
        
        search.async { [weak self, pattern = pattern] (videos) in
            guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
                return
            }
            
            var dataSourceItems = [DataSourceItem]()
            
            for video in videos {
                if let title = video.title {
                    let matches = regex.matches(in: title, range: NSRange(location: 0, length: title.utf16.count))
                    if 0 < matches.count {
                        dataSourceItems.append(DataSourceItem(data: video))
                    }
                }
            }
            
            self?.tableView.dataSourceItems = dataSourceItems
        }
    }
}
