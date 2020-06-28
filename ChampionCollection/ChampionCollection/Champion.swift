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
    var tags: [String]
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

public struct ChampionInfoData: Decodable {
    public let data: [String: ChampionInfo]
}

public struct ChampionInfo: Decodable {
    var name: String
    var id: String
    var title: String
    var blurb: String
    var image: APIImg
    public var spells: [Spell] = []
    var skins: [Skin]
    public var recommended:[Recommend]
}

public struct Skin: Decodable {
    var id: String
    var name: String
}
public struct Recommend:Decodable{
    public var champion:String
    public var title:String
    public var mode:String
    public var type:String
    public var blocks:[Block]
}
public struct Block:Decodable{
    public var type:String
    public var items:[ChampionItems]
}
public struct ChampionItems:Decodable{
    public var id:String
}
