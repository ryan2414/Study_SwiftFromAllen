//: [Previous](@previous)

import Foundation

// 접근 제어의 개념
class SomeClass {
    private var name = "이름"
    
    func nameChange(name: String) {
        self.name = name
    }
}

var s = SomeClass()
s.nameChange(name: "홍길동")










//: [Next](@next)
