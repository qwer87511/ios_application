//
//  Champion.swift
//  ChampionCollection
//
//  Created by 黃俊維 on 2020/6/5.
//  Copyright © 2020 黃俊維. All rights reserved.
//

import Foundation

public struct Champions: Decodable {
    let data: [String: Champion]
}

public struct Champion: Decodable {
    var name: String
    var id: String
    var title: String
    var blurb: String
    var image: APIImg
}

public struct APIImg: Decodable {
    var full: String
    var sprite: String
}

public struct Spell: Decodable {
    var id: String
    var name: String
    var image: APIImg
}

public struct ChampionsData: Decodable {
    let data: [String: ChampionData]
}

public struct ChampionData: Decodable {
    var name: String
    var id: String
    var title: String
    var blurb: String
    var image: APIImg
    var spells: [Spell]
    var skins: [Skin]
}

public struct Skin: Decodable {
    var id: Int
    var name: String
}
