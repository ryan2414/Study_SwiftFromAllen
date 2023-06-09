//: [Previous](@previous)

import Foundation

// 구조체, 클래스의 메서드
// 1) 인스턴스 메서드
class Dog {
    var name: String
    var weight: Double
    
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
    
    func sit() {
        print("\(name)가 앉았습니다.")
    }
    
    func layDown() {
        print("\(name)가 누웠습니다.")
    }
    
    func play() {
        print("열심히 놉니다.")
    }
    
    func changeName(newName name: String) {
        self.name = name
    }
}

let bori = Dog(name: "보리", weight: 20.0)

// 인스턴스(객체)의 메서드
bori.sit()
bori.layDown()
bori.play()

bori.changeName(newName: "말썽쟁이보리")
bori.name
bori.sit()
bori.layDown()
bori.play()

let choco = Dog(name: "초코", weight: 20.0)
// 인스턴스(객체)의 메서드는 인스턴스의 이름을 통해 호출 가능
choco.sit()
choco.layDown()
choco.play()


// 클래스의 인스턴스 메서드
class Dog1 {
    static var species = "Dog"
    
    var name: String
    var weight: Double
    
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
    
    func sit() {
        print("\(name)가 앉았습니다.")
    }
    
    func trainning() {
        print("월월 저는 \(Dog1.species)입니다.")
        sit()
        sit()
        self.sit()
    }
    
    func changeName(newName name: String) {
        self.name = name
    }
}

let bori1 = Dog1(name: "보리", weight: 20.0)
bori1.trainning()

bori1.changeName(newName: "말썽쟁이보리")
bori1.sit()

// 구조체의 인스턴스 메서드
// 값 타입(구조체, 열거형)에서 기본적으로 인스턴스 메서드 내에서 속성을 수정할 수 없음
// 수정하려면, mutating(변형되는) 키워드를 붙이면 속성 수정 가능해짐(클래스와 구조체의 차이)

struct Dog2 {
    var name: String
    var weight: Double
    
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
    
    func sit() {
        print("\(name)가 앉았습니다.")
    }
    
    mutating func changeName(newName name: String) {
        self.name = name
    }
}

/**
 값타입의 인스턴스 메서드 내에서 자신의 속성값 수정은 원칙적 불가 --> mutating 키워드 필요
 */

/**
 오버로딩
 - 함수에서의 오버로딩과 동일하게, 클래스, 구조체, 열거형의 메서드에서도 오버로딩을 지원
 */



//: [Next](@next)
