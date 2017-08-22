//
//  AppSearchBarController.swift
//  revide
//
//  Created by syahRiza on 2017/08/22.
//  Copyright © 2017 syahtech. All rights reserved.
//

import UIKit
import Material

class AppSearchBarController: SearchBarController {
    private var menuButton: IconButton!
    private var moreButton: IconButton!

    open override func prepare() {
        super.prepare()
        prepareMenuButton()
        prepareMoreButton()
        prepareStatusBar()
        prepareSearchBar()
    }

    private func prepareMenuButton() {
        menuButton = IconButton(image: Icon.cm.menu)
    }

    private func prepareMoreButton() {
        moreButton = IconButton(image: Icon.cm.moreVertical)
    }

    private func prepareStatusBar() {
        statusBarStyle = .lightContent

        // Access the statusBar.
        //        statusBar.backgroundColor = Color.grey.base
    }

    private func prepareSearchBar() {
        searchBar.leftViews = [menuButton]
        searchBar.rightViews = [moreButton]
    }
}
