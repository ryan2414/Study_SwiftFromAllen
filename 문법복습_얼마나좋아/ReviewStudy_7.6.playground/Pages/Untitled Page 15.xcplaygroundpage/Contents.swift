//: [Previous](@previous)

import Foundation

//: [Next](@next)


protocol RandomNumber {
    static func reset()
    func random() -> Int
}

class Number: RandomNumber {
    static func reset() {
        print("다시 세팅")
    }
    
    func random() -> Int {
        return Int.random(in: 1...100)
    }
}

let n = Number()
n.random()
Number.reset()


protocol Togglable {
    mutating func toggle()// mutating의 키워드는 메서드 내에서 속성 변경의 의미일뿐(클래스에서 사용 가능)
}

enum OnOffSwitch: Togglable {
    case on
    case off
    
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}


var s = OnOffSwitch.off
s.toggle()
s.toggle()

class BigSwitch: Togglable {
    var isOn = false
    
    func toggle() {// mutating 키워드 필요없음 (클래스 이기 때문)
        isOn = isOn ? false : true
    }
}

var big = BigSwitch()
print(big.isOn)
big.toggle()
print(big.isOn)




protocol SomeProtocol {
    init(num: Int)
}

class SomeClass: SomeProtocol {
    required init(num: Int) {
        
    }
}

class SomeSubClass: SomeClass {
    // 하위 클래스에서 생성자 구현 안하면 필수 생성자는 자동 상속
    // required init(num: Int)
}

protocol AProtocol {
    init()
}

class ASuperClass {
    init() {
        
    }
}

class ASubClass: ASuperClass, AProtocol {
    // AProtocol을 채택함으로 "required" 키워드 필요하고, 상속으로 인한 "override(재정의)" 재정의 키워드도 필요
    required override init() {
        // 생성자의 내용 구현
    }
}



protocol AProto {
    init?(num: Int)
}

struct AStruct: AProto {
    init?(num: Int) {
        
    }
}

class AClass: AProto {
    required init(num: Int) {
        
    }
    
    
}

protocol DataList {
    subscript(idx: Int) -> Int { get }
}

struct DataStructure: DataList {
    
    subscript(idx: Int) -> Int {    // (최소한만 따르면 됨)
        get {
            return 0
        }
        set {                 // 구현은 선택
            // 상세구현 생략
        }
    }
}


protocol Certificate {
    func doSomething()
}

class Person {
    
}

extension Person: Certificate {
    func doSomething() {
        print("Do Something")
    }
}
