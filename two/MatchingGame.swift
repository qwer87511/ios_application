//
//  MatchingGame.swift
//  two
//
//  Created by student on 2020/3/23.
//  Copyright © 2020年 student. All rights reserved.
//

import Foundation
import GameKit

class MatchingGame {
    var cards = [Card]()
    var first: Bool = true
    var firstIndex: Int = -1
    var firstValue: Int = -1
    var winCount: Int = 0
    var loseCount: Int = 0
    var justWin: Bool = false
    
    public init(numOfPairs: Int) {
        for i in 1...numOfPairs*2 {
            cards += [Card(id: i), Card(id: i)]
        }
        cards = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: cards) as! [Card]
    }
    
    public func chooseCard(at index: Array<Card>.Index) {
        
        cards[index].isOpened = !cards[index].isOpened
        
        if first {
            firstIndex = index
            firstValue = cards[index].id
            closeUnmatchedCards()
        }
        else {
            if cards[index].id == firstValue {
                cards[index].isMatched = true
                cards[firstIndex].isMatched = true
                winCount += 1
                justWin = true
            }
            else {
                loseCount += 1
                justWin = false
            }
        }
    }
    
    public func isOver() -> Bool {
        for i in cards {
            if i.isMatched == false {
                return false
            }
        }
        return true
    }

    public func isOpenedCard(i: Int) -> Bool {
        return cards[i].isOpened
    }
    
    public func setAllCards(isOpened: Bool) {
        for i in 0..<cards.count {
            cards[i].isOpened = isOpened
        }
    }
    
    public func isFirst() -> Bool {
        return first;
    }
    
    public func nextTurn() {
        first = !first
    }
    
    public func getFirstValue() -> Int {
        return firstValue
    }
    
    public func getFirstIndex() -> Int {
        return firstIndex
    }
    
    public func getWinCount() -> Int {
        return winCount
    }
    
    public func getLoseCount() -> Int {
        return loseCount
    }
    
    public func isJustWin() -> Bool {
        return justWin;
    }
    
    public func reset() {
        for i in 0..<cards.count {
            cards[i].isOpened = false;
        }
        winCount = 0
        loseCount = 0
        first = true
    }
    
    public func getCard(i : Int) -> Card {
        return cards[i]
    }
    
    private func closeUnmatchedCards() {
        for i in 0..<cards.count {
            if !cards[i].isMatched {
                cards[i].isOpened = false;
            }
        }
    }
}
