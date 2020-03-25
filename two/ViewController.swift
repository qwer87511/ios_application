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
        
        // open all
        clickTurn("useless")
        
        // turn a random card
        firstValue = Int(arc4random_uniform(UInt32(b.count)))
        clickb(b[firstValue])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var b: [UIButton]!
    @IBOutlet weak var f: UITextField!
    @IBOutlet weak var ff: UITextField!
    
    lazy var game = MatchingGame(numOfPairs: (b.count + 1) / 2)
    
    
    
    let cards: [String] = Array(1...13).map {
        (number) -> String in String(number)}
    
    var s = 0
    var firstValue = -1
    var closedTitle = "😀"
    
    
    @IBAction func clickb(_ sender: UIButton) {
        print(1)
        s = s + 1
        ff.text = String(s);
        let cardIndex = Int(b.index(of: sender)!)
        
        if firstValue == -1 {
            firstValue = Int(cards[cardIndex])!
        }
        game.chooseCard(at: cardIndex)
        refreshCard(i: cardIndex)
    }
    
    private func updateCards() {
        
    }
    
    private func openCard(sender: UIButton, cardIndex: Array<Card>.Index) {
        sender.backgroundColor = .green
        sender.setTitle(cards[cardIndex], for: UIControlState.normal)
        let value = Int(cards[cardIndex])!
        
        
        if(value == 1 || value > firstValue){
            f.text = "win";
        }
        else {
            f.text = "lose";
        }
    }
    private func closeCard(sender: UIButton, cardIndex: Array<Card>.Index) {
        sender.setTitle(closedTitle, for: UIControlState.normal)
        sender.backgroundColor = .red
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
    }
    
    @IBAction func clickTurn(_ sender: Any) {
        game.setAllCards(isOpened: !game.isOpenedCard(i: 0))
        refreshAllCards()
    }
}

