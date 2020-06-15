//
//  Champion.swift
//  ChampionCollection
//
//  Created by 黃俊維 on 2020/6/5.
//  Copyright © 2020 黃俊維. All rights reserved.
//

import Foundation

public struct Champions: Decodable {
    let data: [String:Champion]
}

public struct Champion: Decodable {
    var name: String
    var id: String
    var title: String
    var blurb: String
    let image: APIImg
}

public struct APIImg: Decodable {
    let full: String
    let sprite: String
}

public struct Spell: Decodable {
    let id: String
    let name: String
    let image: APIImg
}

public struct ChampionData: Decodable {
    var name: String
    var id: String
    var title: String
    var blurb: String
    let image: APIImg
    let spells: [Spell]
}
