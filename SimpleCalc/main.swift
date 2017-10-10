//
//  main.swift
//  SimpleCalc
//
//  Created by Jessie Kuo on 09/10/2017.
//  Copyright © 2017 appcat. All rights reserved.
//  
//  @author: Yeun-Yuan Kuo
//


import Foundation

print("Enter an expression seperated by returns:")

var numbers: [Double] = []
var end = false
var opTrue = false
var op = ""
var result = 0.0
var error = false

while (!end) {
    let input = readLine(strippingNewline: true)!
    
    if (input == "+" || input == "-" || input == "*" || input == "/" || input == "%") {
        op = input
        opTrue = true
    } else {
        var splitStr = input.components(separatedBy: " ")
        if (splitStr[splitStr.count - 1] == "count" || splitStr[splitStr.count - 1] == "avg" || splitStr[splitStr.count - 1] == "fact") {
            op = splitStr.removeLast()
            end = true
            for i in splitStr {
                numbers.append(Double.init(i)!)
            }
        } else if (splitStr.count == 1 && (Double(splitStr[0]) != nil)) {
            numbers.append(Double.init(input)!)
            if (opTrue) {
                end = true
            }
        } else {
            error = true
            print("What you entered doesn't make sense!")
        }
    }
}

if (opTrue) {
    if (numbers.count == 2) {
        if (op == "+") {
            result = numbers[0] + numbers[1]
        } else if (op == "-") {
            result = numbers[0] - numbers[1]
        } else if (op == "*") {
            result = numbers[0] * numbers[1]
        } else if (op == "/") {
            result = numbers[0] / numbers[1]
        } else {
            result = numbers[0].truncatingRemainder(dividingBy: numbers[1])
        }
    } else {
        error = true
        print("Please enter two values and an operatpr only (see below for example).")
        print("|e.g.|")
        print("|2   |")
        print("|+   |")
        print("|2   |")
    }
} else {
    if (op == "count") {
        result = Double(numbers.count)
    } else if (op == "avg") {
        var total = 0.0
        for num in numbers {
            total += num
        }
        result = total / Double(numbers.count)
    } else if (op == "fact") {
        if (numbers.count != 1) {
            print("Please enter one value only in order to use factorial (see below for example).")
            print("|e.g.|")
            print("|5   |")
            print("|fact|")
        } else {
            var total = 1
            for num in (1...Int(numbers[0])) {
                total *= num
            }
            result = Double(total)
        }
    }
}

if (!error) {
    let isInteger = floor(result) == result
    if (isInteger) {
        print("Result: \(Int(result))")
    } else {
        print("Result: \(result)")
    }
}

