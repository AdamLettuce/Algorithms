//  Created by Adam on 11/05/2020.
import Foundation

enum Operator {
    case Add
    case Substract
    case Multiply
    case Divide
}

class Expression {
    fileprivate let operands: FixedSizeStack<Int> = FixedSizeStack(capacity: 10)
    fileprivate let operators: FixedSizeStack<Operator> = FixedSizeStack(capacity: 10)
    
    fileprivate let expression: String
    
    init(_ expression: String) {
        self.expression = expression
    }
    
    func evaluate() -> Int {
        let elements = expression.split(separator: " ")
        for element in elements {
            if element == "+" {
                operators.push(element: Operator.Add)
            } else if element == "-" {
                operators.push(element: Operator.Substract)
            } else if element == "*" {
                operators.push(element: Operator.Multiply)
            } else if element == "/" {
                operators.push(element: Operator.Divide)
            } else if element == "(" {
            } else if element == ")" {
                let operand1 = operands.pop()!
                let operand2 = operands.pop()!
                let operation = operators.pop()!
                switch operation {
                case Operator.Add:
                    operands.push(element: (operand1+operand2))
                case Operator.Multiply:
                    operands.push(element: (operand1*operand2))
                case Operator.Divide:
                    operands.push(element: (operand1/operand2))
                case Operator.Substract:
                    operands.push(element: (operand1-operand2))
                }
            } else {
                operands.push(element: Int(element)!)
            }
        }
        return operands.pop()!
    }
}
