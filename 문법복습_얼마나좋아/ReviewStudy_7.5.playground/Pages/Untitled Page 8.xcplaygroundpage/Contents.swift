//: [Previous](@previous)

import Foundation

// 3) 초기화
// 초기화와 생성자

/**
 - 초기화는 클래스, 구조체, 열거형의 인스턴스를 생성하는 과정임
 - 각 "저장 속성"에 대한 초기값을 설정하여 인스턴스를 사용가능한 상태로 만드는 것
 - (열거형은 저장속성이 존재하지 않으므로, case 중에 한가지를 선택 및 생성)
 
 - 결국, 이니셜라이저의 실행이 완료되었을 때,
 - 인스턴스의 모든 저장속성이 초기값을 가지는 것이 --> 생성자의 역할
 
 - 참고) 소멸자
 - 생성자와 반대개념의 소멸자도 있음
 - 소멸자 --> 인스턴스가 해제되기 전에 해야할 기능을 정의하는 부분
 */

// 생성자의 구현의 기본

// 클래스, 구조체, 열거형 동일

class Color {
    let red: Double
    let green: Double
    let blue: Double
    
    // 생성자도 오버로딩 지원
    
    init() {
        red = 0.0
        blue = 0.0
        green = 0.0
    }
    
    init(white: Double) {
        red = white
        blue = white
        green = white
    }
    
    init(red: Double, green:Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
}

/**
 - 초기화의 방법(저장속성이 초기값을 가져야 함)
 - 1) 저장 속성의 선언과 동시에 값을 저장
 - 2) 저장 속성을 옵셔널로 선언 (초기값이 없어도 nil로 초기화됨)
 - 3) 생성자에서 값을 초기화
 
 - 반드시 생성자를 정의해야만 하는 것은 아님
 
 - 1-2번 방법으로 이니셜라이저를 구현하지 않아도,
 - 컴파일러는 기본 생성자를 자동으로 생성함 ---> init()
 - ====> 이니셜라이저 구현하면, 기본 생성자를 자동으로 생성하지 않음
 */

var color = Color() // 기본 생성자 호출. 결국 Color()는 생성자를 호출하는 것임 (매서드 호출 문법과 형태 동일)


// 멤버와이즈 이니셜라이저 - 구조체의 특별한 생성자
// 구조체는 멤버와이즈 이니셜라이저 자동 제공

struct Color1 {
    var red: Double = 1.0
    var green: Double = 1.0
    var blue: Double
}


/**
 - 생성자의 기본 원칙
 - 컴파일러는 기본 생성자를 자동으로 생성함 ==> init()
 - ===> 이니셜라이저 구현하면, 기본 생성자를 자동으로 생성하지 않음
 
 - 구조체는 저장 속성들이 기본값을 가지고 있더라도,
 - 추가적으로 Memberwise(멤버에 권한) 이니셜라이저를 자동으로 제공함
 
 - 개발자가 직접적으로 생성자를 구현하면, 멤버와이즈 이니셜라이저가 자동으로 제공되지 않음
 - (멤버와이즈 이니셜라이저는 편의적 기능일뿐)
 
 - 구조체에서만 선언된 저장 속성의 이름을 파라미터로 제공하기 때문에 멤버에 관한 생성자를 제공한다는 뜻에서 멤버와이즈 이니셜라이저라고 부름
 
 */

/**
 - 왜 맴버와이즈 이니셜라이저를 제공할까?
 
 - 굳이 이유를 찾자면, 클래스보다 더 편하게 쓰기 위함일 것으로 추측
 - 클래스의 경우에는, 생성자가 상속하고 관련이 있기 때문에 복잡.
 **/
//: [Next](@next)
