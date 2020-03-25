//
//  Card.swift
//  two
//
//  Created by student on 2020/3/23.
//  Copyright © 2020年 student. All rights reserved.
//

import Foundation

struct Card {
    var id:Int
    var isMached:Bool = false
    var isOpened:Bool = true
    
    init(id:Int) {
        self.id = id
    }
}
