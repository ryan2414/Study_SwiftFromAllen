//: [Previous](@previous)

import Foundation
// Defer문

//: [Next](@next)

func deferStatement1() {
    defer {
        print("나중에 실행하기")
    }
    
    print("먼저 실행하기")
}

deferStatement1()


func deferStatement2() {
    if true {
        print("먼저 실행하기")
        return
    }
    
    defer {
        print("나중에 실행하기")
    }
}

deferStatement2()

func deferStatement3() {
    defer {
        print(1)
    }
    defer {
        print(2)
    }
    defer {
        print(3)
    }
}

deferStatement3()

for i in 1...3 {
    defer { print("Defer된 숫자?: \(i)")}
    print("for문의 숫자: \(i)")
}
