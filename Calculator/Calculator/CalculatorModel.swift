//
//  CalculatorModel.swift
//  Calculator
//
//  Created by 廖育筠 on 2020/4/28.
//  Copyright © 2020 呆. All rights reserved.
//

import Foundation

class CalculatorModel {
    
    public init() {
        
    }
    
    public enum operation {
        case add
        case sub
        case mul
        case div
        case mod
    }
    
    var currentNumber: String = "0"
    var isFirstNumber = true
    var firstNumber = 0
    var op: operation? = nil
    var isShowingNumber = true
    
    var showingNumber:String {
        get {
            if isShowingNumber && currentNumber == "0" {
                return String(firstNumber)
            }
            else {
                return currentNumber
            }
        }
    }

    
    public func inputNumber(_ num: Int) {
        if isShowingNumber {
            currentNumber = "0"
        }
        
        if currentNumber == "0" {
            currentNumber = String(num)
        }
        else {
            currentNumber.append(String(num))
        }
        
        isShowingNumber = false
    }
    
    public func setOperation(op: operation) {
        self.op = op
        if isFirstNumber {
            firstNumber = Int(currentNumber)!
        }
        isFirstNumber = false
        currentNumber = "0"
        isShowingNumber = true
    }
    
    public func calculate() {
        if op != nil {
            var result = 0
            
            switch op {
                case .add:
                    result = firstNumber + Int(currentNumber)!
                case .sub:
                    result = firstNumber - Int(currentNumber)!
                case .mul:
                    result = firstNumber * Int(currentNumber)!
                case .div:
                    if currentNumber != "0" {
                        result = firstNumber / Int(currentNumber)!
                    }
                    else {
                        result = 0
                    }
                    
                case .mod:
                    result = firstNumber % Int(currentNumber)!
                case nil:
                    break
            }
            
            isFirstNumber = true
            firstNumber = result
            currentNumber = "0"
            
        }
        isShowingNumber = true
    }
    
    public func changeSign() {
        currentNumber = String(-Int(currentNumber)!)
    }
    
    public func allClean() {
        currentNumber = "0"
        isFirstNumber = true
        firstNumber = 0
        isShowingNumber = false
    }
    
}
