//: [Previous](@previous)

import Foundation

//: [Next](@next)


let numbers = [1, 2, 3]

var sum = 0

for number in numbers {
    sum += number
}

print(sum)


let newNumbers = [1, 2, 3]
var newSum = 0

newSum = newNumbers.reduce(0) {$0 + $1}
print(newSum)



var numbersArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

var newResult = numbersArray.filter{$0 % 2 != 0}.map{$0 * $0}.reduce(0) { $0 + $1 }
print(newResult)
