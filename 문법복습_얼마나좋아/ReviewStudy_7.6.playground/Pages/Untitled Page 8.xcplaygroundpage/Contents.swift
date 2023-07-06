//: [Previous](@previous)

import Foundation

class SomeType {
    
}

extension SomeType {
    
}

class Person {
    var id = 0
    var name = "이름"
    var email = "1234@gmail.com"
    
    func walk() {
        print("사람이 걷는다.")
    }
}

class Student: Person {
    var studentId = 1
    
    override func walk() {
        print("학생이 걷는다.")
    }
    
    func study() {
        print("학생이 공부한다.")
    }
}

extension Student {
    func play() {
        print("학생이 논다.")
    }
}

class Undergraduate: Student {
    var major = "전공"
    
    override func walk() {
        print("대학생이 걷는다.")
    }
    
    override func study() {
        print("대학생이 공부한다.")
    }
    
    func party() {
        print("대학생이 파티한다.")
    }
    
    // 스위프트에서는 확장에서 구현한 메서드에 대한 재정의가 불가 ⭐️
}

//extension Undergraduate {
//    override func play() {
//        print("대학생이 논다.")
//    }
//}

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double {return self }
    var cm: Double {return self / 100.0}
    var mm: Double {return self / 1_000.0}
    var ft: Double { return self / 3.28084}
}

let oneInch = 25.4.mm
print("1Inch is \(oneInch)m")

let threeFeet = 3.ft
print("3Feet is \(threeFeet)m")

let aMarathon = 42.km + 195.m
print("Marathon is \(aMarathon) m")


extension Int {
    var squard: Int {
        return self * self
    }
}

func squard(num : Int) -> Int {
    return num * num
}

Int(123).squard
123.squard
squard(num: 123)

//: [Next](@next)
