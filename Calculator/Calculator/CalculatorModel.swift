//
//  CalculatorModel.swift
//  Calculator
//
//  Created by 廖育筠 on 2020/4/28.
//  Copyright © 2020 呆. All rights reserved.
//

import Foundation

extension Double {
    var stringWithoutTrailingZeros: String {
        return String(format: "%g", self)
    }
}

class CalculatorModel {
    
    public init() {
        
    }
    
    public enum operation {
        case add
        case sub
        case mul
        case div
    }
    
    var currentNumber: String = "0"
    var firstNumber = "0"
    
    var op: operation? = nil
    
    var isFirstNumber = true
    var isShowingFirstNumber = false
    var isCalculated = true
    var isHavingNumber = false
    
    var showingNumber: String {
        get {
            if isShowingFirstNumber {
                return Double(firstNumber)!.stringWithoutTrailingZeros
            }
            else {
                return currentNumber
            }
        }
    }
    
    var log: String = ""
    
    public func inputNumber(_ num: Int) {
        if isShowingFirstNumber {
            currentNumber = "0"
        }
        
        if currentNumber == "0" {
            currentNumber = String(num)
        }
        else {
            currentNumber.append(String(num))
        }
        
        isShowingFirstNumber = false
        
        isHavingNumber = true
        
        if op != nil {
            isCalculated = false
        }
    }
    
    public func setOperation(op: operation) {
        if !isCalculated {
            calculate()
        }
        
        if (isHavingNumber) {
            firstNumber = currentNumber
        }
        
        isShowingFirstNumber = true
        currentNumber = "0"
        isFirstNumber = false
        
        self.op = op

        isHavingNumber = false
    }
    
    public func calculate() {
        if op != nil && !isFirstNumber {
            var result = 0.0
            
            guard let lhs = Double(firstNumber) else { return }
            guard let rhs = Double(currentNumber) else { return }
            
            var opSymbol: String = "?"
            
            switch op {
                case .add:
                    result = lhs + rhs
                    opSymbol = "+"
                case .sub:
                    result = lhs - rhs
                    opSymbol = "-"
                
                case .mul:
                    result = lhs * rhs
                    opSymbol = "*"
                
                case .div:
                    if rhs != 0 {
                        result = lhs / rhs
                    }
                    else {
                        result = 0
                    }
                    opSymbol = "÷"
                
                case nil:
                    break
            }
            
            currentNumber = String(result)
            firstNumber = currentNumber
            log = "\(lhs.stringWithoutTrailingZeros) \(opSymbol) \(rhs.stringWithoutTrailingZeros)"
        }
        isShowingFirstNumber = true
        isCalculated = true
        op = nil
        isHavingNumber = false
    }
    
    public func changeSign() {
        log = "±(\(currentNumber))"
        currentNumber = String(-Double(currentNumber)!)
        isShowingFirstNumber = false
        isHavingNumber = true
    }
    
    public func changeToPercentage() {
        if !isCalculated {
            calculate()
        }
        log = "\(currentNumber)%"
        currentNumber = String(0.01 * Double(currentNumber)!)
        isShowingFirstNumber = false
        isHavingNumber = true
    }
    
    public func allClean() {
        currentNumber = "0"
        firstNumber = "0"
        op = nil
        isFirstNumber = true
        isShowingFirstNumber = false
        isCalculated = true
        isHavingNumber = false
        log = ""
    }
    
    public func dot() {
        if isShowingFirstNumber {
            currentNumber = "0."
        }

        else if !currentNumber.contains(".") {
            currentNumber.append(".")
        }
        
        isShowingFirstNumber = false
        
        isHavingNumber = true
        
        if op != nil {
            isCalculated = false
        }
    }
}
