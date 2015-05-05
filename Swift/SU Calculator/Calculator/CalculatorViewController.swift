//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by n0p and Mari on 2015-03-10.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController
{
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var stack: UILabel!

    var userIsInTheMiddleOfTypingANumber = false

    var brain = CalculatorBrain()

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!

        // TODO: well, and how to write this check in just one line?
        if digit == "." && display.text!.rangeOfString(digit) != nil {
            return
        }

        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }

    @IBAction func removeDigit() {
        if userIsInTheMiddleOfTypingANumber {
            if var text = display.text {
                text = dropLast(text)
                if count(text) < 1 {
                    text = "0"
                    userIsInTheMiddleOfTypingANumber = false
                }
                display.text = text
            }
        } else {
            displayValue = brain.popStack()
        }
    }

    // TODO: fix it!
    @IBAction func changeSign() {
        if let value = displayValue {
            if value > 0.0 {
                display.text = "-" + display.text!
            } else if value < 0.0 {
                display.text = dropFirst(display.text!)
            }
            userIsInTheMiddleOfTypingANumber = true
        }
    }

    @IBAction func checkErrors() {
        let result = brain.evaluateAndReportErrors()
        switch result {
        case .Success(let value):
            displayValue = value
        case .Failure(let error):
            display.text = error
        }
    }

    @IBAction func appendConstant(sender: UIButton) {
        processInput(source: sender, withOperation: brain.pushConstant)
    }

    @IBAction func operate(sender: UIButton) {
        processInput(source: sender, withOperation: brain.performOperation)
    }

    @IBAction func pushVariable(sender: UIButton) {
        processInput(source: sender, withOperation: brain.pushOperand)
    }

    @IBAction func setVariable(sender: UIButton) {
        if var name = sender.currentTitle {
            name.removeAtIndex(name.startIndex)
            displayValue = brain.setVariable(name, value: displayValue)
        }
    }

    @IBAction func clearVariable(sender: UIButton) {
        if var name = sender.currentTitle {
            name.removeAtIndex(name.endIndex.predecessor())
            displayValue = brain.clearVariable(name)
        }
    }

    @IBAction func clearStack() {
        brain.clearStack()
        displayValue = 0
    }

    func processInput(source sender: UIButton, withOperation operation: (String) -> Double?) {
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        if let value = sender.currentTitle {
            displayValue = operation(value)
        }
    }

    @IBAction func enter() {
        if !userIsInTheMiddleOfTypingANumber {
            return
        }
        userIsInTheMiddleOfTypingANumber = false
        if let value = displayValue {
            displayValue = brain.pushOperand(value)
        } else {
            displayValue = 0
        }
    }

    var displayValue: Double? {
        get {
            return NSNumberFormatter().numberFromString(display.text!)?.doubleValue
        }
        set {
            display.text = newValue != nil ? "\(newValue!)" : " "
            userIsInTheMiddleOfTypingANumber = false
            stack.text = brain.description
        }
    }
}

