//: [Previous](@previous)

import Foundation

// 4) 생성자
// 구조체 vs 클래스 생성자

/**
 - (지정)생성자 <====> 편의 생성자
 
 [구조체의 생성자]
 - 1) 지정 생성자. (자동 제공되는 멤버와이즈 생성자)
 - 2) 실패가능생성자
 
 [클래스의 생성자]
 - 1) 지정 생성자
 - 2) 편의 생성자 (상속과 관련)
 - 3) 필수 생성자 (상속과 관련)
 - 4) 실패가능생성자
 */

// 구조체 생성자
// 여러개의 지정 생성자 구현
// 구조체나 클래스, 둘다 아래처럼 구현 가능(오버로딩을 지원하므로)

struct Color {
    let red, green, blue: Double
    
    init() {    // 기본 생성자. 기본값을 설정하면 자동으로 제공됨
        red = 0.0
        green = 0.0
        blue = 0.0
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    
}

// 구조체(값타입)의 지정생성자의 구현
struct Color1 {
    let red, green, blue: Double
    
    init() {    // 구조체는 다른 생성자를 호출하는 방식도 가능
        self.init(red: 0.0, green: 0.0, blue: 0.0)
    }
    
    init(white: Double) {
        self.init(red: white, green: white, blue: white)
    }
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
}

// 값타입(구조체)의 경우 자체 지정생성자 작성할 때
// 생성자 내에서 self.init(...)를 사용하여 다른 이니셜라이저를 호출하도록 할 수 있음


// 클래스 생성자
// 클래스의 지정 vs 편의 생성자
class Color2 {
    let red, green, blue: Double
    
    convenience init() {
        self.init(red: 0.0, green: 0.0, blue: 0.0)
    }
    
    convenience init(white: Double) {
        self.init(red: white, green: white, blue: white)
    }
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.blue = blue
        self.green = green
    }
}

// 이미 모든 속성을 초기화하는 지정생성자가 있다면 모든 속성을 초기화하지 않는 경우 편의 생성자로 구현을 권장
class AClass {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {      // 지정생성자 - 모든 저장 속성 설정
        self.x = x
        self.y = y
    }
    
    convenience init() {        // 편의생성자 - (조금 편리하게 생성) 모든 저장 속성을 설정하지 않음
        self.init(x: 0, y: 0)
    }
}

class BClass: AClass {
    var z: Int
    
    init(x: Int, y: Int, z: Int) {
        self.z = z
        super.init(x: x, y: y)
    }
    
    convenience init(z: Int) {
        self.init(x: 0, y: 0, z: z)
    }
    
    convenience init() {
        self.init(z: 0)
    }
    
    func doSomething() {
        print("Do something")
    }
}

let a = AClass(x: 1, y: 1)
let a1 = AClass()

let b = BClass(x: 1, y: 1, z: 1)
let b1 = BClass(z: 2)
let b2 = BClass()


// 클래스의 상속과 지정 생성자와 편의 생성자의 호출 규칙

/**
 - 생성자의 위임 규칙
 
 - (1) 델리게이트 업
 -      서브클래스의 지정생성자는 수퍼 클래스의 지정생성자를 반드시 호출해야함
 - (2) 델리게이트 어크로스
 -      편의생성자는 동일한 클래스에서 다른 이니셜라이저를 호출해야하고, 궁극적으로 지정생성자를 호출해야함
 
 - ===> 인스턴스 메모리 생성에 대한 규칙이 존재함(규칙을 안지키면 인스턴스가 올바르게 초기화되지 않음)
 */

// 클래스의 상속과 초기화 과정의 이해
/**==================================================================
 - 인스턴스의 모든 저장 속성이 초기값을 가지면 완전히 초기화된 것임(생성 완료)

 - 각 단계에서 선언된 저장속성은 각 해당 단계에서 초기값을 가져야 함
 - ===> 그리고나서 수퍼클래스로 생성 위임(델리게이트 업)이 일어나야 함


 - [1단계] (필수사항)
 - 해당 클래스에서 선언한 모든 저장속성에 값이 있는지 확인하여 메모리 초기화
 - 상위 지정생성자로 델리게이트 업하여 (해당 단계의) 모든 저장 속성의 메모리 초기화
 - (최종적으로) Base 클래스가 모든 저장 속성에 값이 있는지 확인하면
 - 저장속성이 완전히 초기화 된 것으로 간주되어 인스턴스가 생성 완료

 
 - [2단계] (선택사항)
 - 인스턴스의 생성 완료 후,
 - 상속관계의 맨 위에서 아래로 내려가면서, 호출된 각각의 생성자가 인스턴스를 추가로 커스텀함
 - (커스텀의 의미: 새로운 값을 셋팅하거나 메서드 호출 등이 가능)
 - 메모리가 초기화가 완료된 후이므로
 - 이제 self 속성에 접근이 가능해지고, 속성을 수정하거나 인스턴스 메서드를 호출이 가능해짐
 =====================================================================**/






//: [Next](@next)
