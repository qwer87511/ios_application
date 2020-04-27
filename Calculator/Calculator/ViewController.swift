//
//  ViewController.swift
//  Calculator
//
//  Created by 廖育筠 on 2020/4/28.
//  Copyright © 2020 呆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model: CalculatorModel = CalculatorModel();
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickNumber(_ sender: UIButton) {
        model.inputNumber(sender.tag)
        result.text = model.showingNumber
    }
    
    @IBAction func clickEqual(_ sender: UIButton) {
        model.calculate()
        result.text = model.showingNumber
    }
    
    @IBAction func clickOperator(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            model.setOperation(op: .add)
        case 1:
            model.setOperation(op: .sub)
        case 2:
            model.setOperation(op: .mul)
        case 3:
            model.setOperation(op: .div)
        case 4:
            model.setOperation(op: .mod)
        default:
            break;
        }
        result.text = model.showingNumber
    }
    
    @IBAction func clickSign(_ sender: Any) {
        model.changeSign()
    }
    
    @IBAction func clickDot(_ sender: Any) {
        
    }
    
    
    @IBAction func clickAllClean(_ sender: Any) {
        model.allClean()
        result.text = model.showingNumber
    }
    
}

