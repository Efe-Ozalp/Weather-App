//
//  CalculatorViewModel.swift
//  Weather App
//
//  Created by Lorenzo J. Ablis on 9/8/23.
//

import Foundation

final class CalculatorViewModel: ObservableObject {
    @Published var firstNum = "0"
    @Published var secondNum = "0"
    @Published var operation = ""
    
    func displayUpdate() -> String {
        return operation.isEmpty ? firstNum : secondNum
    }
    
    func inputUpdate(input: String) {
        switch input {
        case "+", "-", "/", "X":
            self.operation = input
        case "AC":
            self.firstNum = "0"
            self.secondNum = "0"
            self.operation = ""
        case "%":
            if (operation == "") {
                self.firstNum = String((Double(firstNum) ?? 0)/100.0)
            } else {
                self.secondNum = String((Double(secondNum) ?? 0)/100.0)
            }
        case "+/-":
            if (operation == "") {
                self.firstNum = String((Double(firstNum) ?? 0) * (-1.0))
            } else {
                self.secondNum = String((Double(secondNum) ?? 0) * (-1.0))
            }
        case ".":
            if (operation == "") {
                if (firstNum.contains(".")) {
                    break
                } else {
                    self.firstNum += "."
                }
            } else {
                if (secondNum.contains(".")) {
                    break
                } else {
                    self.secondNum += "."
                }
            }
        case "=":
            self.firstNum = calculate()
            self.secondNum = "0"
            self.operation = ""
        default:
            operation == "" ? (firstNum += input) : (secondNum += input)
        }
    }
    
    func calculate() -> String {
        let (num1, num2) = (Double(firstNum) ?? 0, Double(secondNum) ?? 0)
        
        switch operation {
        case "/":
            return String(num1 / num2)
        case "X":
            return String(num1 * num2)
        case "-":
            return String(num1 - num2)
        case "+":
            return String(num1 + num2)
        default:
            return ""
        }
    }
}
