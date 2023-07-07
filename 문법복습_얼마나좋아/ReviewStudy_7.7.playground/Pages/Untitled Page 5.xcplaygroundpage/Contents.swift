//: [Previous](@previous)

import Foundation


let immutableArray = [1, 2, 3, 4, 5]

immutableArray.forEach { num in
    print(num)
}

immutableArray.forEach { print("숫자: \($0)")}
//: [Next](@next)



let stringArray: [String?] = ["A", nil, "B", nil, "C"]

var newStringArray = stringArray.compactMap { $0 }
print(newStringArray)



let numbers = [-2, -1, 0, 1, 2]

var positiveNumbers = numbers.compactMap { $0 >= 0 ? $0 : nil }
print(positiveNumbers)

newStringArray = stringArray.filter { $0 != nil }.map { $0! }
print(newStringArray)




var nestedArray = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

print(nestedArray.flatMap { $0 })



var newNnestedArray = [[[1,2,3], [4,5,6], [7, 8, 9]], [[10, 11], [12, 13, 14]]]

var numbersArray = newNnestedArray.flatMap { $0 }.flatMap{$0}
print(numbersArray)
