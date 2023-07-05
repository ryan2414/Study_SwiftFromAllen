//: [Previous](@previous)

import Foundation

// 클래스의 지정, 편의 생성자의 상속과 재정의

class AClass {
    var x = 0
    
    //init() {}         // 기본 생성자가 자동으로 제공됨
}

let a = AClass()
print("a 출력해보기 a.x: \(a.x)")

class BClass: AClass {
    var y: Int
    
    // 🎾 [1단계] 상위의 지정생성자 고려 ==============================
    // 상위에 동일한 이름이 있으므로 재정의 해야함 (이 형태는 안됨)
//    init() {
//
//    }
    
    // (선택 1) 지정생성자로 재정의
    override init() {       // 상위 클래스와 "이름이 동일한 생성자" 구현은 재정의만 가능함(올바른 재정의) (지정생성자로 구현)
        self.y = 0
        super.init()
    }
    
    // (선택 2) 서브클래스에서 편의생성자로 구현해보기
    // 상위 클래스와 "이름이 동일한 생성자" 구현은 재정의만 가능함(올바른 재정의) (지정생성자 필요)
//    override convenience init() {
//        self.init(y: 0)
//    }
    
    // (선택 3) 재정의 하지 않을 수도 있음 (상속안함)
    
    
    // 🎾 [2단계] (현재단계의) 생성자 구현 ============================
    init(y: Int) {
        self.y = y
        super.init()
    }
}



let b = BClass()
print("b 출력해보기 b.x: \(b.x), b.y: \(b.y)")


class CClass: BClass {
    var z: Int
    
    override init() {// 상위 클래스와 "이름이 동일한 생성자" 구현(올바른 재정의)
        self.z = 0
        super.init()// 2단계 값설정(커스텀)없고, 상위구현에 기본 init() 만 있는 경우 생략가능(암시적 요청)
    }
    
    init(z: Int) {
        self.z = z
        super.init()// 2단계 값설정(커스텀)없고, 상위구현에 기본 init() 만 있는 경우 생략가능(암시적 요청)
    }
}


let c = CClass()
print("c 출력해보기 c.x: \(c.x), c.y: \(c.y), c.z: \(c.z)")

let d = CClass(z: 1)
print("d 출력해보기 d.x: \(d.x), d.y: \(d.y), d.z: \(d.z)")


class Vehicle {
    var numberOfWheels = 0
    
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
    
    // init() {}
}

// numberOfWheels의 저장 속성에 기본값을 제공, 생성자 구현하지 않았으므로
// ===> 기본 생성자 init() 자동제공

let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")


class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

// 커스텀 init() 정의 ===> 생성자가 상위클래스의 이름과 동일 하므로 재정의 키워드 필요
// 상위 지정생성자 호출하여 메모리 초기화 후, 상위에서 구현한 속성에 접근하여 2로 셋팅(2단계 값설정)

let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")

class Hoverboard: Vehicle {
    var color: String
    
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
    
    //    override convenience init() {
    //        self.init(color: "빨간색")
    //    }
    
    init(color: String) {
        self.color = color      // (현재 클래스) 저장 속성 초기화
        super.init()          // =====> 여기서 암시적으로 호출됨
    }
}


// 생성자에서 Hoverboard 클래스는 색상 속성만 설정
// 2단계 값설정(커스텀)없고, 상위구현에 기본 init() 만 있는 경우 생략가능(암시적 요청) ⭐️


let hoverboard = Hoverboard(color: "silver")
print("Hoverboard: \(hoverboard.description)")     // Hoverboard: 0 wheel(s) in a beautiful silver


//: [Next](@next)
