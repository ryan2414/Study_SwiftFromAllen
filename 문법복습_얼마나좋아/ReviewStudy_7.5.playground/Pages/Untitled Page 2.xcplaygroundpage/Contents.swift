//: [Previous](@previous)

import Foundation

// 타입 메서드
// 메서드이지만, 인스턴스의 성격이 아닌 타입 자체의 성격에 가까운 메서드 일때

class Dog {
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
        print("월월 저는 \(Dog.species)입니다.")
        sit()
        sit()
        self.sit()
    }
    
    func changeName(newName name: String) {
        self.name = name
    }
    
    static func letmeKnow() { // 타입 메서드에서, 타입속성에 접근시에는 타입으로 접근하지 않아도 됨
        print("종은 항상 \(species)입니다.") //Dog.species라고 써도 됨
    }
}


let bori = Dog(name: "보리", weight: 20.0)
bori.sit()

bori.changeName(newName: "말썽쟁이보리")
bori.sit()

// 타입 메서드의 호출
Dog.letmeKnow()

/**
 인스턴스 기능이 아닌, 타입 자체에 필요한 기능을 구현할 때 주로 사용
 타입 자체가 가져야 하는 공통된 기능(동작) 구현시
 */

// 클래스 - 타입 메서드의 상속
// 타입 메서드를 상속시 재정의가능 하도록 하려면 ---> static 키워드를 상속가능한 class 키워드로 바꿔야 함

// 상위 클래스
class SomeClass {
    class func someTypeMethod() { // 타입 메서드
        print("타입과 관련된 공통된 기능의 구현")
    }
}

//SomeClass.someTypeMethod()

// 상속한 서브클래스
class SomeThingClass: SomeClass {
    override class func someTypeMethod() {
        super.someTypeMethod()
        print("타입과 관련된 공통된 기능의 구현(업그레이드)")
    }
}

SomeThingClass.someTypeMethod()


// class - 상속시 재정의 가능 키워드
// static 키워드로 선언하면 (상속시) 재정의 불가 (상속이 불가한 것 아님)


//: [Next](@next)
