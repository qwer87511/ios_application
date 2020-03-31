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
        for i in 0..<numOfPairs*2 {
            cards += [Card(id: i, number: i / 2)]
        }
        cards = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: cards) as! [Card]
    }
    
    public func chooseCard(at index: Int) {
        
        //cards[index].isOpened = !cards[index].isOpened
        
        // first card
        if first {
            firstIndex = index
            firstValue = cards[index].id
            closeUnmatchedCards()
            cards[index].isOpened = true
            first = false
        }
        // second card
        else {
            // chose the first card
            if index == firstIndex {
                cards[index].isOpened = false
            }
            // chose the other card
            else {
                cards[index].isOpened = true
                // mached
                if cards[index].id == firstValue {
                    cards[index].isMatched = true
                    cards[firstIndex].isMatched = true
                    winCount += 1
                    justWin = true
                }
                // not mached
                else {
                    loseCount += 1
                    justWin = false
                }
            }
            
            first = true
        }

        ///////////////////////////////
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

    public func isMatchedCard(i: Int) -> Bool {
        return cards[i].isMatched
    }
    
    public func setAllCards(isOpened: Bool) {
        for i in 0..<cards.count {
            cards[i].isOpened = isOpened
        }
    }
    
    public func isFirst() -> Bool {
        return first;
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
