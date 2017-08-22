//
//  VideoService.swift
//  revide
//
//  Created by syahRiza on 2017/08/22.
//  Copyright © 2017 syahtech. All rights reserved.
//

import Material
import Graph

public func persistRow(_ row : Dictionary<String,Any>){

    let graph = Graph()

    let video = Entity(type: "Video")

    for(key, value) in row {
       video[key] = value
    }

    graph.sync()

}

public func cleanData(){
    let graph = Graph()

    graph.clear()
}
