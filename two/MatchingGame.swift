//
//  MatchingGame.swift
//  two
//
//  Created by student on 2020/3/23.
//  Copyright © 2020年 student. All rights reserved.
//

import Foundation

class MatchingGame {
    var cards = [Card]()
    var isFirst: Bool = false
    var firstValue: Int = -1
    
    public init(numOfPairs: Int) {
        for i in 1...numOfPairs {
            cards += [Card(id: i), Card(id: i)]
        }
    }
    
    public func chooseCard(at index: Array<Card>.Index) {
        isFirst = !isFirst
        cards[index].isOpened = !cards[index].isOpened
        
        if isFirst {
            firstValue = cards[index].id
        }
        else {
            if cards[index].id == firstValue {
                cards[index].isMached = true
                // firstCard.isMatch = true
            }
            
            else {
                cards[index].isOpened = false
                // firstCard.isOpened = false
            }
        }
    }

    public func isOpenedCard(i: Int) -> Bool {
        return cards[i].isOpened
    }
    
    public func setAllCards(isOpened: Bool) {
        for i in 0..<cards.count {
            cards[i].isOpened = isOpened
        }
    }
}
