//: [Previous](@previous)

import Foundation

let numbers = [1, 2, 3, 4, 5]

var newNumbers = numbers.map { num in
    return "숫자: \(num)"
}

print(newNumbers)

var newNumbers1 = numbers.map { "숫자: \($0)" }

print(newNumbers1)

//: [Next](@next)


var alphabet = ["A", "B", "C", "D"]

var newAlphabet = alphabet.map { (name) -> String in
    return name + "'s good"
}

print(newAlphabet)



let names = ["Apple", "Black", "Circle", "Dream", "Blue"]


var newNames = names.filter { (name) -> Bool in
    return name.contains("B")
}

print(newNames)


let array = [1, 2, 3, 4, 5, 6, 7, 8]

var evenNumbersArray = array.filter { num in
    return num % 2 == 0
}

evenNumbersArray = array.filter { $0 % 2 == 0 }

print(evenNumbersArray)

evenNumbersArray = array.filter { $0 % 2 == 0 }.filter { $0 < 5 }

print(evenNumbersArray)



var numbersArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

var resultSum = numbersArray.reduce(0) { (sum, num) in
    return sum + num
}

print(resultSum)


resultSum = numbersArray.reduce(100) {$0 - $1}
print(resultSum)


numbersArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

var newResult = numbersArray.filter { $0 % 2 != 0 }.map { $0 * $0 }.reduce(0) { $0 + $1 }
    
print(newResult)
