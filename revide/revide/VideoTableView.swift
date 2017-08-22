import UIKit
import Material
import Graph
import AlamofireImage

class VideoTableView: TableView {
    /**
     Retrieves the data source items for the tableView.
     - Returns: An Array of DataSourceItem objects.
     */
    var dataSourceItems = [DataSourceItem]() {
        didSet {
            reloadData()
        }
    }
    
    /// Prepares the tableView.
    open override func prepare() {
        super.prepare()
        dataSource = self
        delegate = self
    }
}

extension VideoTableView: TableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceItems.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /// Prepares the cells within the tableView.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        guard let video = dataSourceItems[indexPath.row].data as? Entity else {
            return cell
        }
        
        cell.textLabel?.text = video.title
        let url = URL(string: video.thumbnailURL!)!
        let placeholderImage = UIImage(named: "thumbnail")!
        let filter = AspectScaledToFillSizeWithRoundedCornersFilter(
            size: CGSize(width:50,height:50),
            radius: 10.0
        )
        
        cell.dividerColor = Color.grey.lighten3
        cell.imageView?.af_setImage(
            withURL: url,
            placeholderImage: placeholderImage,
            filter: filter
        )
        
        return cell
    }
}

extension VideoTableView: TableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
