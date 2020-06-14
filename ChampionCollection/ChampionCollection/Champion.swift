//
//  Champion.swift
//  ChampionCollection
//
//  Created by 黃俊維 on 2020/6/5.
//  Copyright © 2020 黃俊維. All rights reserved.
//

import Foundation

public struct Champions: Decodable {
    let data:[String:Champion]
}

public struct Champion:Decodable {
    var name: String
    var id: String
    var title: String
    var blurb: String
    let image:ChampionImg
}

public struct ChampionImg:Decodable{
    let full:String
    let sprite:String
}
