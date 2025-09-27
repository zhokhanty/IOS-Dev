////
////  main.swift
////  lab2
////
////  Created by Zhalgas Bagytzhan on 23.09.2025.
////
//
import Foundation
//
//// Problem 1: FizzBuzz
//print("Problem 1: FizzBuzz")
//
//var i = 1
//var result = ""
//
//while i <= 100 {
//    if i % 15 == 0 {
//        result += "FizzBuzz "
//    } else if i % 3 == 0 {
//        result += "Fizz "
//    } else if i % 5 == 0 {
//        result += "Buzz "
//    } else {
//        result += "\(i) "
//    }
//    i += 1
//}
//print(result)
//
//// Problem 2: Prime Numbers
//print("\nProblem 2: Prime Numbers")
//
//
//var primes: [Int] = []
//var num = 2
//
//while num <= 100 {
//    if (2..<num).allSatisfy({ num % $0 != 0 }) {
//        primes.append(num)
//    }
//    num += 1
//}
//print(primes)
//
//// Problem 3: Temperature Converter
//print("\nProblem 3: Temperature Converter")
//
//print("Enter a temperature in Celsius: ", terminator: "")
//guard let inputTemp = readLine(), let temperature = Double(inputTemp) else {
//    print("Invalid input")
//    exit(1)
//}
//
//print("Enter a unit (C for Celsius, F for Fahrenheit, K for Kelvin): ", terminator: "")
//guard let unit = readLine()?.uppercased() else {
//    print("Invalid input")
//    exit(1)
//}
//
//switch unit {
//case "C":
//    let f = (temperature * 9/5) + 32
//    let k = temperature + 273.15
//    print("\(temperature)°C = \(f)°F = \(k)K")
//case "F":
//    let c = (temperature - 32) * 5/9
//    let k = c + 273.15
//    print("\(temperature)°F = \(c)°C = \(k)K")
//case "K":
//    let c = temperature - 273.15
//    let f = (c * 9/5) + 32
//    print("\(temperature)K = \(c)°C = \(f)°F")
//default:
//    print("Invalid input")
//}
//
//// Problem 4: Shopping List Manager
//print("\nProblem 4: Shopping List Manager")
//
//var items = ["T-shirts", "Jeans", "Dresses", "Shoes", "Toiletries", "Books", "Electronics"]
//var shoppingList: [String] = []
//
//print("Welcome to your shopping list manager!")
//print("Here is your current shopping list:")
//
//while true {
//    print("\nWhat would you like to do? (add, remove, list, exit)\n", terminator: "")
//    guard let action = readLine()?.lowercased() else { continue }
//    
//    switch action {
//    case "add":
//        print("Add to your shopping list\n", terminator: "")
//        guard let itemToAdd = readLine() else { continue }
//        
//        if items.contains(itemToAdd) {
//            if !shoppingList.contains(itemToAdd) {
//                shoppingList.append(itemToAdd)
//                print("\(itemToAdd) added.")
//            } else {
//                print("\(itemToAdd) is already in your shopping list.")
//            }
//        } else {
//            print("\(itemToAdd) is not available in the store.")
//        }
//        
//    case "remove":
//        print("Remove from your shopping list\n", terminator: "")
//        guard let itemToRemove = readLine() else { continue }
//        
//        if let index = shoppingList.firstIndex(of: itemToRemove) {
//            shoppingList.remove(at: index)
//            print("\(itemToRemove) removed.")
//        } else {
//            print("\(itemToRemove) not found in your shopping list.")
//        }
//        
//    case "list":
//        if shoppingList.isEmpty {
//            print("Empty")
//        } else {
//            for item in shoppingList {
//                print(item)
//            }
//        }
//        
//    case "exit":
//        print("Goodbye!")
//        exit(0)
//        
//    default:
//        print("Invalid input")
//    }
//}
//
//// Problem 5: Word Frequency Counter
//print("Problem 5: Word Frequency Counter\n")
//
//print("Write a sentence or paragraph and I will tell you how often each word appears.\n", terminator: "")
//guard let input = readLine() else { fatalError("No input provided.") }
//
//let words = input.split(whereSeparator: { !$0.isLetter })
//var frequencyMap: [String: Int] = [:]
//
//for word in words {
//    let lowercasedWord = String(word).lowercased()
//    frequencyMap[lowercasedWord, default: 0] += 1
//}
//print(frequencyMap)
//
//// Problem 6: Fibonacci Sequence
//print("\nProblem 6: Fibonacci Sequence\n")
//
//func fibonacci(_ n: Int) -> Int {
//    guard n >= 0 else {
//        return 0
//    }
//    
//    if n < 2 {
//        return n
//    }
//    return fibonacci(n - 1) + fibonacci(n - 2)
//}
//print(fibonacci(9))

//// Problem 7: Grade Calculator
//print("Problem 7: Grade Calculator\n")
//
//var list_of_students: [String: Int] = [
//    "Zhalgas": 85,
//    "Azamat": 90,
//    "Gala": 70,
//    "Kairbek": 88,
//    "Sultan": 22
//]
//
//print("Best student: \(list_of_students.max(by: {$0.value < $1.value})?.key ?? "No student") with score \(list_of_students.max(by: {$0.value < $1.value})?.value ?? 0)")
//print("Worst student: \(list_of_students.min(by: {$0.value < $1.value})?.key ?? "No student") with score \(list_of_students.min(by: {$0.value < $1.value})?.value ?? 0)")
//
//var average_score = list_of_students.values.reduce(0, +) / list_of_students.count
//print("Average score: \(average_score)")
//
//for (key, value) in list_of_students {
//    if value == average_score {
//        print("Equal to average score: \(key) with score \(value)")
//    } else if value > average_score {
//        print("Above: \(key) with score \(value)")
//    } else {
//        print("Below: \(key) with score \(value)")
//    }
//}

//// Problem 8: Palindrome Checker
//print("Problem 8: Palindrome Checker\n")
//
//print("Enter a word or phrase:")
//if let input = readLine() {
//    let cleaned = input.lowercased().filter { $0.isLetter || $0.isNumber }
//    let reversed = String(cleaned.reversed())
//    if cleaned == reversed {
//        print("\(input) is a palindrome")
//    } else {
//        print("\(input) is not a palindrome")
//    }
//}

//// Problem 9: Simple Calculator
//print("Problem 9: Simple Calculator\n")
//
//func addition(_ a: Double, _ b: Double) -> Double {
//    return a + b
//}
//func subtraction(_ a: Double, _ b: Double) -> Double {
//    return a - b
//}
//func multiplication(_ a: Double, _ b: Double) -> Double {
//    return a * b
//}
//func division(_ a: Double, _ b: Double) -> Double {
//    return a / b
//}
//
//print("Enter a number: ")
//guard let input = readLine(), var result = Double(input) else {
//    fatalError("Invalid input")
//}
//
//while(true) {
//    print("Enter an operator (+, -, *, /, =): ")
//    guard let op = readLine() else {
//        fatalError("Invalid input")
//    }
//    if op != "=" {
//        print("Enter a number: ")
//        guard let input2 = readLine(), let num = Double(input2) else {
//            fatalError("Invalid input")
//        }
//        switch op {
//            case "+":
//                result = addition(result, num)
//            case "-":
//                result = subtraction(result, num)
//            case "*":
//                result = multiplication(result, num)
//            case "/":
//                if(num == 0) {
//                    print("Error: Division by zero!")
//                    continue
//                }
//                result = division(result, num)
//            default:
//                print("Invalid operator!")
//        }
//    } else {
//        print("Result: \(result)")
//        break
//    }
//    
//}

//// Problem 10: Unique Characters
//print("Problem 10: Unique Characters\n")
//
//func hasUniqueChar(_ input: String) -> Bool {
//    var seen: Set<Character> = []
//    for char in input {
//        if seen.contains(char) {
//            return false
//        }
//        seen.insert(char)
//    }
//    return true
//}
//
//print("Enter a word: ", terminator: "")
//if let input = readLine() {
//    if hasUniqueChar(input) {
//        print("The word has unique characters.")
//    } else {
//        print("The word does not have unique characters.")
//    }
//} else {
//    print("Invalid input.")
//}
