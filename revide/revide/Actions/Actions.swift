//
//  Actions.swift
//  revide
//
//  Created by syahRiza on 2017/08/22.
//  Copyright © 2017 syahtech. All rights reserved.
//

import ReSwift

// all of the actions that can be applied to the state
struct RevideActionLoading: Action {}
struct RevideActionLoaded: Action {
    let totalVideos : Int
}
struct RevideActionSearch: Action {
    let keyWord : String
}
