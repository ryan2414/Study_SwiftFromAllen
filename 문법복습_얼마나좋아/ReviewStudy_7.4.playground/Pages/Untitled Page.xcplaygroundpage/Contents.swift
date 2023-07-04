//: [Previous](@previous)

import Foundation

// 타입속성(Type Prooerties)
// static(고정적인/고정된)이라는 키워드를 추가한 저장 속성

class Dog {
    static var species: String = "Dog"
    
    var name: String
    var weight: Double
    
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
}

let dog = Dog(name: "초코", weight: 15.0)
dog.name
dog.weight

Dog.species  // --> 타입(형식)의 이름으로 접근해야함.

// 저장속성, 계산속성 2가지 모두 타입속성이 될 수 있음

// 1) 저장 타입(형식) 속성
class Circle {
    // (저장) 타입 속성 (값이 항상 있어야함)
    static let pi: Double = 3.14
    static var count: Int = 0
    
    // 저장 속성
    var radius: Double
    // 계산속성
    var diameter: Double {
        get {
            return radius * 2
        }
        set {
            radius = newValue / 2
        }
    }
    
    init(radius: Double) {
        self.radius = radius
        Circle.count += 1
    }
}

var circle1 = Circle(radius: 2)
Circle.count

var circle2 = Circle(radius: 3)
Circle.count

let a = Circle.pi


// 2) 계산 타입(형식) 속성
class Circle1 {
    // 저장 타입 속성
    static let pi: Double = 3.14
    static var count: Int = 0
    
    // (계산) 타입 속성
    static var multiPi: Double {
        return pi * 2
    }
    
    // 저장 속성
    var radius: Double
    
    // 생성자
    init(radius: Double) {
        self.radius = radius
    }
}

let b = Circle1.multiPi

// 타입 속성의 메모리 구조의 이해
/**
 - 저장 타입 속성
 - 일반 저장속성은 인스턴스를 생성할때, 생성자에서 모든 속성을 초기화를 완료
    그리고, 해당 저장 속성은 각 인스턴스가 가진 고유한 값임
 - 하지만, 저장 타입(형식) 속성은 생성자가 따로 없기 때문에, 타입 자체(유형 그 자체)에 속한 속성이기 때문에 항상 기본값이 필요. 생략할 수 없음
 
 - 지연 속성의 성격을 가짐
 - 저장 타입속성은 기본적으로 지연 속성(속성에 처음 접근하는 순간에 초기화됨)이지만, lazy라고 선언할 필요는 없음
 (참고: 여러 스레드에 동시에 엑세스하는 경우에도 한 번만 초기화되도록 보장됨. Tread-Safe)
 */

// 주의점
/**
 - 타입 속성 ---> 클래스, 구조체, 열거형에 모두 추가할 수 있음
 
 - let 또는 var 둘다 선언 가능
 - 타입 속성은 특정 인스턴스에 속한 속성이 아니기 때문에 인스턴스 이름으로는 접근 불가
 */

// 인스턴스 내에서도 접근하려면 타입이름 + 속성으로 써야 접근 가능함

class Circle2 {
    static let pi: Double = 3.14
    static var count: Int = 0
    
    var radius: Double
    
    init(radius: Double) {
        self.radius = radius
        Circle2.count += 1
    }
    
    func getArea() -> Double {
        let area = Circle2.pi * radius * radius
        return area
    }
}

let c1 = Circle2(radius: 3)
c1.getArea()
Circle2.count

let c2 = Circle2(radius: 2)
Circle2.count


/**
 - 어떤 경우에 타입 속성을 선언해야 하나?
 - 모든 인스턴스가 동일하게 가져아 하는 속성이거나(해당 타입의 보편적인 속성), 모든 인스턴스가 공유해야하는 성격에 가까운 것이어야 함
 
 - 상속에서 재정의(overriding)
 
 - 1) 저장 타입 속성 ---> 상속에서, 하위클래스에서 재정의 불가능(class 키워드 안됨)(인스턴스의 경우도 저장 속성은 고유의 틀이기 때문에 건드릴 수 없음)
 - 2) 계산 타입 속성 ---> 상속에서, 상위 클래스에서 class 키워드를 붙인 경우, 재정의 가능
 
 - class 키워드(계산 타입 속성만)
 - 상속이 있는 경우, 계산 타입 속성에서는  static대신 class 키워드를 사용(----> static과 동일한 역할) 하면 재정의 가능한 속성이 됨
 */



//: [Next](@next)
