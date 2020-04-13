//
//  ViewController.swift
//  two
//
//  Created by student on 2020/3/23.
//  Copyright © 2020年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

    lazy var game = MatchingGame(numOfPairs: (b.count + 1) / 2)

    
    var flipCount = 0 {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    private func updateFlipCountLabel() {
        //let 
    }
    
    var closedTitle = ""
    var emojis = "😋🐆🌖🔥🌈💦☔️🥄"
    var emojiDict = [Card: String]()
    
    private func getEmoji(card: Card) -> String {
        if emojiDict[card] == nil, emojis.count > 0 {
            let randomIndex = emojis.index(emojis.startIndex, offsetBy: Int(arc4random_uniform(UInt32(emojis.count))))
            emojiDict[card] = String(emojis.remove(at: randomIndex))
        }
        return emojiDict[card] ?? "?"
    }

    @IBAction func clickb(_ sender: UIButton) {
        flipCount = flipCount + 1
        ff.text = String(flipCount);
        
        let cardIndex = Int(b.index(of: sender)!)
        
        game.chooseCard(at: cardIndex)
        
        refreshAllCards()
        
        refreshCounts()
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
    
    private func refreshCounts() {
        winLable.text = String(game.getWinCount())
        loseLable.text = String(game.getLoseCount())
    }
    
    @IBAction func clickReset(_ sender: Any) {
        game.reset()
        refreshAllCards()
        refreshCounts()
    }
}

