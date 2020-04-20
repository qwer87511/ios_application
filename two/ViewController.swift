//
//  ViewController.swift
//  two
//
//  Created by student on 2020/3/23.
//  Copyright © 2020年 student. All rights reserved.
//

import UIKit

extension Int {
    var arc4random: Int {
        if self >= 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }
        else {
            return -Int(arc4random_uniform(UInt32(-self)))
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let numbers = [12, 34, 56, 78, 90, 21, 43, 65, 97, 709]
        print("before")
        for n in numbers {
            print(String(n))
        }
        print("after")
        for n in numbers.sorted(by: {($0 % 10) > ($1 % 10)}) {
            print(String(n))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var b: [UIButton]!
    @IBOutlet weak var f: UITextField!
    @IBOutlet weak var ff: UITextField!
    
    @IBOutlet weak var winLable: UILabel!
    @IBOutlet weak var loseLable: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    lazy var game = MatchingGame(numOfPairs: (b.count + 1) / 2)

    
    var flipCount = 0 {
        didSet {
            let attributes: [NSAttributedStringKey: Any] = [
                .strokeWidth: 5.0,
                .strokeColor: UIColor.orange
            ]
            let attributedString = NSAttributedString(string: "\(flipCount)", attributes: attributes)
            ff.attributedText = attributedString
        }
    }

    var closedTitle = ""
    var emojisArray = ["🐶🐱🐭🐹🐰🦊🐻🐼", "🍏🍎🍐🍊🍋🍌🍉🍇", "⚽️🏀🏈⚾️🎾🏐🏉🎱", "🚗🚕🚙🚌🚎🏎🚓🚑", "😀☺️😘🤑😞😫😯😨", "🇲🇵🇬🇹🇹🇼🇸🇿🇳🇪🇳🇮🇮🇳🇪🇭"]
    lazy var emojis = emojisArray[0]
    var emojiDict = [Card: String]()
    
    private func getEmoji(card: Card) -> String {
        if emojiDict[card] == nil, emojis.count > 0 {
            let randomIndex = emojis.index(emojis.startIndex, offsetBy: emojis.count.arc4random)
            emojiDict[card] = String(emojis.remove(at: randomIndex))
        }
        return emojiDict[card] ?? "?"
    }

    @IBAction func clickb(_ sender: UIButton) {
        flipCount += 1
        
        let cardIndex = Int(b.index(of: sender)!)
        
        game.chooseCard(at: cardIndex)
        
        refreshAllCards()
        
        refreshScore()
        
        scoreLabel.text = String(game.getScore())
    }
    
    private func updateCards() {
        
    }
    
    private func openCard(sender: UIButton, cardIndex: Int) {
        sender.backgroundColor = .green
        sender.setTitle(getEmoji(card: game.getCard(i: cardIndex)), for: UIControlState.normal)
    }
    private func closeCard(sender: UIButton, cardIndex: Int) {
        sender.setTitle(closedTitle, for: UIControlState.normal)
        sender.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
    
    private func refreshAllCards() {
        for i in 0..<b.count {
            refreshCard(i: i)
        }
    }
    
    private func refreshCard(i: Int) {
        if game.isOpenedCard(i: i) {
            openCard(sender: b[i], cardIndex: i)
        }
        else {
            closeCard(sender: b[i], cardIndex: i)
        }
        
        if game.isMatchedCard(i: i) {
            b[i].backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0.3033670775)
        }
    }
    
    @IBAction func clickTurn(_ sender: Any) {
        game.setAllCards(isOpened: !game.isOpenedCard(i: 0))
        refreshAllCards()
    }
    
    private func refreshScore() {
        winLable.text = String(game.getWinCount())
        loseLable.text = String(game.getLoseCount())
        scoreLabel.text = String(game.getScore())
    }
    
    @IBAction func clickReset(_ sender: Any) {
        game.reset()
        refreshAllCards()
        refreshScore()
        resetTheme()
    }
    
    private func resetTheme() {
        emojis = emojisArray[emojisArray.count.arc4random]
        emojiDict = [Card: String]()
    }
}

