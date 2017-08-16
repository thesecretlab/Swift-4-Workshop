//: Playground - noun: a place where people can play

import UIKit

func add(number: Int, to anotherNumber: Int) -> Int {
    return number + anotherNumber
}

add(number: 1, to: 2)

var addFunction = add

addFunction(1,2)


func applyOperation(firstNumber: Int, secondNumber: Int, operation: (Int,Int)->Int ) -> Int {
    
    return operation(firstNumber, secondNumber)
    
}

applyOperation(firstNumber: 2, secondNumber: 5, operation: addFunction)

applyOperation(firstNumber: 5, secondNumber: 8, operation: +)

let data = [1,2,3,4]

let doubled = data.map { $0 * 2 }

doubled

let sum = data.reduce(0) { $0 + $1 }

sum

let filtered = data.filter { $0 > 2 }

filtered

func numberToDigits(number: Int) -> [Int] {
    
    var localNum = number
    
    var result : [Int] = []
    
    while localNum > 0 {
        result.append(localNum % 10)
        localNum /= 10
    }
    
    return result.reversed()
    
}

numberToDigits(number: 1337)

var digitsToWords = { (digits : [Int]) -> String in
    // The lookup table that maps digits to words
    let wordDictionary = [ 0: "zero",
                           1: "one",
                           2: "two",
                           3: "three",
                           4: "four",
                           5: "five",
                           6: "six",
                           7: "seven",
                           8: "eight",
                           9: "nine"
    ]
    // Convert each digit to a word, and join the result up with spaces
    return digits
        .map { wordDictionary[$0] ?? "" } .joined(separator: " ")
}

digitsToWords([1,3,3,7])

func combine<T, U, V>(firstChanger: @escaping (T) -> U, secondChanger: @escaping (U) -> V) -> (T) -> V {
    
    return {
        (x : T) -> V in
        return secondChanger(firstChanger(x))
    }
    
}

let numberToString = combine(firstChanger: numberToDigits, secondChanger: digitsToWords)

numberToString(1337)






