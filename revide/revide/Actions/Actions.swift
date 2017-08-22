//
//  Actions.swift
//  revide
//
//  Created by syahRiza on 2017/08/22.
//  Copyright © 2017 syahtech. All rights reserved.
//

import ReSwift
import Graph

// all of the actions that can be applied to the state
struct RevideActionLoading: ReSwift.Action {}
struct RevideActionPlayerOpened: ReSwift.Action {}
struct RevideActionLoaded: ReSwift.Action {
    let totalVideos : Int
}
struct RevideActionPlayVideo: ReSwift.Action {
    let videoObj : Entity
}
struct RevideActionSearch: ReSwift.Action {
    let keyWord : String
}
