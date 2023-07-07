import UIKit

class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

struct Calculator {
    var number: Int = 0
    
    mutating func plusNumber(_ num: Int) {
        number = number + num
    }
    
    mutating func reset() {
        self = Calculator()
    }
}

struct MyStruct {
    static let club = "iOS부서"
    
    static func doPrinting() {
        print("소속은 \(self.club)입니다.")
    }
}

class SomeClass {
    static let name = "SomeClass"
}

let myClass: SomeClass.Type = SomeClass.self

print(SomeClass.name)
print(SomeClass.self.name)

Int.max
Int.self.max

extension Int {
    static public var zero: Self = 0
    
    var zero: Self {
        return 0
    }
    
    static func toZero() -> Self {
        return Self.zero
    }
    
    func toZero() -> Self {
        return self.zero
    }
}

Int.zero
5.zero

Int.toZero()
5.toZero()


extension BinaryInteger {
    func squard() -> Self {
        return self * self
    }
}

let x1: Int = -7
let y1: UInt = 7

7.squard()
