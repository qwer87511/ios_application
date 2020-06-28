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

public struct ChampionsData: Decodable {
    let data: [String: ChampionData]
}

//public struct WrappedChampionAPIData: Decodable {
//    var data: ChampionAPIData
//}
//
//public struct ChampionAPIData: Decodable {
//
//    var championData: ChampionData?
//
//    struct ChampionKey: CodingKey {
//        var stringValue: String
//
//        init?(stringValue: String) {
//            self.stringValue = stringValue
//        }
//
//        var intValue: Int? { return nil }
//        init?(intValue: Int) { return nil }
//
//        static let name = ChampionKey(stringValue: "name")
//        static let id = ChampionKey(stringValue: "id")
//        static let title = ChampionKey(stringValue: "title")
//        static let blurb = ChampionKey(stringValue: "blurb")
//        static let image = ChampionKey(stringValue: "image")
//        static let spells = ChampionKey(stringValue: "spells")
//        static let skins = ChampionKey(stringValue: "skins")
//    }
//
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: ChampionKey.self)
//        for key in container.allKeys {
//            let championContainer = try container.nestedContainer(keyedBy: ChampionKey.self, forKey: key)
//            let name = try championContainer.decode(String.self, forKey: ChampionKey.name!)
//            //let description = try productContainer.decodeIfPresent(String.self, forKey: .description)
//
//            championData = ChampionData(name: name, id: "", title: "", blurb: "", image: APIImg(full: "", sprite: ""), spells: [Spell](), skins: [Skin]())
//        }
//    }
//}

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
    var id: String
    var name: String
}

