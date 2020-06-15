//
//  Runes.swift
//  ChampionCollection
//
//  Created by HsiaoFuChien on 2020/6/15.
//  Copyright © 2020 黃俊維. All rights reserved.
//

import Foundation

struct  RuneSet:Decodable {
    let slots:[RunesData]
    let id:Int
    let key:String
    let name:String
    let icon:String
}

struct RunesData:Decodable {
    let runes:[Runes]
}

struct Runes :Decodable,Hashable {
    let id:Int
    let key:String
    let name:String
    let icon:String
    let shortDesc:String
}
