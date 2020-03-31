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

    
    var s = 0
    var closedTitle = ""
    
    
    @IBAction func clickb(_ sender: UIButton) {
        s = s + 1
        ff.text = String(s);
        
        let cardIndex = Int(b.index(of: sender)!)
        
        game.chooseCard(at: cardIndex)
        
        refreshAllCards()
        
        refreshCounts()
    }
    
    private func updateCards() {
        
    }
    
    private func openCard(sender: UIButton, cardIndex: Array<Card>.Index) {
        sender.backgroundColor = .green
        sender.setTitle(String(game.getCard(i: cardIndex).number), for: UIControlState.normal)
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
    
    private func refreshCounts() {
        winLable.text = String(game.getWinCount())
        loseLable.text = String(game.getLoseCount())
    }
    
    @IBAction func clickReset(_ sender: Any) {
//        game.reset()
//        let firstValue = Int(arc4random_uniform(UInt32(b.count)))
//        clickb(b[firstValue])
//        game.nextTurn()
    }
}

