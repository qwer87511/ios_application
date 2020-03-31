//
//  Card.swift
//  two
//
//  Created by student on 2020/3/23.
//  Copyright © 2020年 student. All rights reserved.
//

import Foundation

struct Card {
    var id: Int
    var number: Int
    var isMatched: Bool = false
    var isOpened: Bool = false
    
    init(id:Int, number: Int) {
        self.id = id
        self.number = number
    }
}
