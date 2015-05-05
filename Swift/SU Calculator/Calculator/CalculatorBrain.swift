//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by n0p and Mari on 2015-03-15.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

import Foundation

class CalculatorBrain
{
    private enum Op: Printable {
        case Operand(Double)
        case Variable(String)
        case Constant(String, Double)
        case UnaryOperation(symbol: String, operation: Double -> Double, check: (Double -> String?)?)
        case BinaryOperation(symbol: String, function: (Double, Double) -> Double, priority: Int, check: ((Double, Double) -> String?)?)

        private var description: String {
            switch self {
            case .Operand(let operand):
                return "\(operand)"
            case .Variable(let symbol):
                return symbol.uppercaseString
            case .Constant(let symbol, _):
                return symbol
            case .UnaryOperation(let symbol, _, _):
                return symbol
            case .BinaryOperation(let symbol, _, _, _):
                return symbol
            }
        }

        private var priority: Int {
            switch self {
            case .Operand(_): fallthrough
            case .Variable(_): fallthrough
            case .Constant(_, _): fallthrough
            case .UnaryOperation(_, _, _):
                return Int.max
            case .BinaryOperation(_, _, let priority, _):
                return priority
            }
        }
    }

    private var opStack = [Op]()                        // array
    private var knownOps = [String:Op]()                // dictionary

    init() {
        func learnOp(op: Op) {
            knownOps[op.description] = op
        }
        learnOp(Op.Constant("π", M_PI))
        learnOp(Op.Constant("e", M_E))
        learnOp(Op.UnaryOperation(symbol: "√", operation: sqrt, check: {
            if $0 < 0 {
                return "Square root operand is negative!"
            } else {
                return nil
            }
        }))
        learnOp(Op.UnaryOperation(symbol: "sin", operation: sin, check: nil))
        learnOp(Op.UnaryOperation(symbol: "cos", operation: cos, check: nil))
        learnOp(Op.BinaryOperation(symbol: "×", function: *, priority: 10, check: nil))
        learnOp(Op.BinaryOperation(symbol: "÷", function: { $1 / $0 }, priority: 10) { (op1, op2) -> String? in
            if op1.isZero {
                return "Divide by zero!"
            } else {
                return nil
            }
        })
        learnOp(Op.BinaryOperation(symbol: "+", function: +, priority: 5, check: nil))
        learnOp(Op.BinaryOperation(symbol: "−", function: { $1 - $0 }, priority: 5, check: nil))
    }

    var program: AnyObject {    // guaranteed to be a PropertyList
        get {
            return opStack.map { $0.description }
        }
        set {
            if let opSymbols = newValue as? Array<String> {
                var newOpStack = [Op]()
                for opSymbol in opSymbols {
                    if let op = knownOps[opSymbol] {
                        newOpStack.append(op)
                    } else if let operand = NSNumberFormatter().numberFromString(opSymbol)?.doubleValue {
                        newOpStack.append(.Operand(operand))
                    }
                }
                opStack = newOpStack
            }
        }
    }

    private func evaluate(ops: [Op]) -> (result: Double?, description: String, remainingOps: [Op], priority: Int)
    {
        if !ops.isEmpty {
            var remainingOps = ops
            let op = remainingOps.removeLast()

            switch op {
            case .Operand(let operand):
                return (operand, op.description, remainingOps, op.priority)

            case .Variable(let name):
                let variable = variableValues[name]
                if variable == nil  {
                    error = "Variable \(name) not set"
                }
                return (variable, op.description, remainingOps, op.priority)

            case .Constant(_, let operand):
                return (operand, op.description, remainingOps, op.priority)

            case .UnaryOperation(_, let operation, let check):
                let evaluation = evaluate(remainingOps)
                let description = op.description + "(\(evaluation.description))"
                var result: Double? = nil
                if evaluation.result != nil {
                    if let errorString = check?(evaluation.result!) {
                        error = errorString
                    } else {
                        result = operation(evaluation.result!)
                    }
                }
                return (result, description, evaluation.remainingOps, op.priority)

            case .BinaryOperation(_, let operation, _, let check):
                let eval1 = evaluate(remainingOps)
                let eval2 = evaluate(eval1.remainingOps)
                var desc1 = eval1.description
                var desc2 = eval2.description

                if op.priority > eval1.priority {
                    desc1 = "(\(desc1))"
                }
                if op.priority > eval2.priority {
                    desc2 = "(\(desc2))"
                }
                let description = desc2 + " " + op.description + " " + desc1

                var result: Double? = nil
                if eval1.result != nil && eval2.result != nil {
                    if let errorString = check?(eval1.result!, eval2.result!) {
                        error = errorString
                    } else {
                        result = operation(eval1.result!, eval2.result!)
                    }
                }
                return (result, description, eval2.remainingOps, op.priority)
            }
        }
        error = "Not enough operands"
        return (nil, "?", ops, Int.max)
    }

    func evaluate() -> Double? {
        return evaluate(opStack).result
    }

    enum CalcResult {
        case Success(Double?)
        case Failure(String?)
    }

    var error: String?

    func evaluateAndReportErrors() -> CalcResult {
        error = nil
        if let result = evaluate() {
            return CalcResult.Success(result)
        } else {
            return CalcResult.Failure(error)
        }
    }

    func pushOperand(operand: Double) -> Double? {
        opStack.append(Op.Operand(operand))
        return evaluate()
    }

    private var variableValues = [String:Double]()              // variables

    func setVariable(name: String, value: Double?) -> Double? {
        variableValues[name] = value
        return evaluate()
    }

    func pushOperand(operand: String) -> Double? {
        opStack.append(Op.Variable(operand))
        return evaluate()
    }

    func pushConstant(name: String) -> Double? {
        if let constant = knownOps[name] {
            opStack.append(constant)
        }
        return evaluate()
    }

    func performOperation(symbol: String) -> Double? {
        if let operation = knownOps[symbol] {
            opStack.append(operation)
        }
        return evaluate()
    }

    func popStack() -> Double? {
        if count(opStack) > 0 {
            opStack.removeLast()
        }
        return evaluate()
    }

    func clearStack() {
        opStack.removeAll(keepCapacity: false)
        variableValues.removeAll(keepCapacity: true)
    }

    func clearVariable(name: String) -> Double? {
        variableValues.removeValueForKey(name)
        return evaluate()
    }

    var description: String {
        var stack = opStack
        var results = [String]()
        while !stack.isEmpty {
            let result = evaluate(stack)
            var description = result.description
            if result.result != nil && count(stack) - count(result.remainingOps) > 1 {
                description += " = \(result.result!)"
            }
            results.insert(description, atIndex: 0)
            stack = result.remainingOps
        }
        return ",\n".join(results)
    }
}
