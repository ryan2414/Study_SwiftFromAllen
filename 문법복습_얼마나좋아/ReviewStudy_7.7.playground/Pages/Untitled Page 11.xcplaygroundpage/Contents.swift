//: [Previous](@previous)

import Foundation



//: [Next](@next)


var stored = 0

let closure = { (number: Int) -> Int in
    stored += number
    return stored
}


closure(3)

closure(4)   // 어떤 결과가 나올까?

closure(5)

stored = 0

closure(5)   // 어떤 결과가 나올까?


func calculate(number: Int) -> Int {
    var sum = 0
    
    func square(num: Int) -> Int {
        sum += (num * num)
        return sum
    }
    
    let result = square(num: number)
    
    return result
}


calculate(number: 10)
calculate(number: 20)
calculate(number: 30)

func calculateFunc() -> ((Int) -> Int) {
    var sum = 0
    
    func square(num: Int) -> Int {
        sum += (num * num)
        return sum
    }
    
    return square
}

var squareFunc = calculateFunc()

squareFunc(10)
squareFunc(20)
squareFunc(30)

var dodoFunc = squareFunc
dodoFunc(20)
