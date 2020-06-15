//
//  Item.swift
//  ChampionCollection
//
//  Created by HsiaoFuChien on 2020/6/15.
//  Copyright © 2020 黃俊維. All rights reserved.
//

import Foundation
struct ItemData:Decodable{
    var data:[String:Item]
}
struct Item:Decodable {
    let name:String
    let image:ItemImage
}
struct ItemImage:Decodable {
    let full:String
    let sprite:String
}
