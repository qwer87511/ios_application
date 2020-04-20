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
    var score = 0
    
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
            firstValue = cards[index].number
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
                if cards[index].number == firstValue {
                    cards[index].isMatched = true
                    cards[firstIndex].isMatched = true
                    winCount += 1
                    score += 2
                    justWin = true
                }
                // not mached
                else {
                    loseCount += 1
                    justWin = false
                    if cards[index].wasEverOpened {
                        score -= 1
                    }
                    if cards[firstIndex].wasEverOpened {
                        score -= 1
                    }
                }
                cards[index].wasEverOpened = true
                cards[firstIndex].wasEverOpened = true
                
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
        cards = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: cards) as! [Card]
        for i in 0..<cards.count {
            cards[i].isOpened = false
            cards[i].isMatched = false
        }
        winCount = 0
        loseCount = 0
        first = true
        justWin = false
        score = 0
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
    
    public func getScore() -> Int {
        return score
    }
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            let faceUpCardIndices = cards.indices.filter { cards[$0].isOpened }
            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
        }
        set {
            for index in cards.indices {
                cards[index].isOpened = index == newValue
            }
        }
    }
}
