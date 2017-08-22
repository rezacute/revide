//
//  AppState.swift
//  revide
//
//  Created by syahRiza on 2017/08/22.
//  Copyright © 2017 syahtech. All rights reserved.
//

import ReSwift
import Graph
struct AppState: StateType {
    var videoCounter: Int = 0
    var searchKeyWord: String = ""
    var stateNavigation: String = "main"
    var selectedVideo : Entity? = nil
}
