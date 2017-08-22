//
//  Reducers.swift
//  revide
//
//  Created by syahRiza on 2017/08/22.
//  Copyright © 2017 syahtech. All rights reserved.
//

import ReSwift
import Alamofire
import SwiftyJSON
import Graph


fileprivate let VIDEO_URL_STRING = "https://gist.githubusercontent.com/sa2dai/04da5a56718b52348fbe05e11e70515c/raw/60a93bd0191a66141cab185a1b814a9828ab12a2/code_test_iOS.json"


func revideReducer(action: ReSwift.Action, state: AppState?) -> AppState {
    var state = state ?? AppState()

    switch action {
    case _ as RevideActionLoading:
        state.videoCounter = 0;
        break;
    case _ as RevideActionSearch:

        break;
    case _ as RevideActionPlayVideo:
        if let obj = (action as? RevideActionPlayVideo)?.videoObj{
            state.selectedVideo = obj
        }

        break;
    case _ as RevideActionPlayerOpened:
        state.selectedVideo = nil
        break;
    default:
        break
    }

    return state
}

func fetchVideos(state: AppState, store: Store<AppState>) -> ReSwift.Action? {
    Alamofire.request(VIDEO_URL_STRING).responseJSON { response in
        debugPrint(response)

        guard let object = response.result.value else {
            print("Oh, no!!!")
            return
        }

        let json = SwiftyJSON.JSON(object)
        if let jArray = json.array {
            for item in jArray {
                if let obj = item.dictionaryObject {
                    persistRow(obj)
                }
            }
            DispatchQueue.main.async() {
                store.dispatch(RevideActionLoaded(totalVideos: jArray.count))
            }
        }
    }
    return RevideActionLoading();
}
