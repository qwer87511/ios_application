//
//  Summoner.swift
//  ChampionCollection
//
//  Created by HsiaoFuChien on 2020/6/15.
//  Copyright © 2020 黃俊維. All rights reserved.
//

import Foundation

struct SummonerData:Decodable {
    let data:[String:Summoner]
}
struct Summoner:Decodable {
    let id:String
    let name:String
    let description:String
    let image:SumImage
}
struct SumImage:Decodable {
    let full:String
}
