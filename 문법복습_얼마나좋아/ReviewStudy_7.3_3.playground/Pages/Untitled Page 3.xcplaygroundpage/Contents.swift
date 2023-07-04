//: [Previous](@previous)

import Foundation

// 구조체, 클래스의 속성
// 1) 저장 속성/ 지연 저장 속성
// 1-1) 저장 속성
// 값이 저장되는 일반적인 속성(변수)를 저장 속성이라고 함

struct Bird {
    var name: String
    var weight: Double
    
    init(name: String, weight: Double) { // 기본값이 없으면, 생성자를 통해 값을 반드시 초기화해야함
        self.name = name
        self.weight = weight
    }
    
    func fly() {
        print("날아갑니다.")
    }
}

var aBird = Bird(name: "참새1", weight: 0.2)
aBird.name
aBird.weight = 0.3

var bBird = Bird(name: "참새2", weight: 0.3)
bBird.name
bBird.weight

/**
 주의점
 - 저장 속성 --> 구조체, 클래스 동일
 - let(상수) 또는 var(변수)로 선언 가능
 
 - 저장 속성은 각 속성자체가 고유의 메모리 공간을 가짐
 - 초기화 이전에 값을 가지고 있거나, 생성자 메서드를 통해 값을 반드시 초기화 해야만 함
 
 */

// 1-2) 지연 저장 속성
struct Bird1 {
    var name: String
    lazy var weight: Double = 0.2
    
    init(name: String) {
        self.name = name
    }
    
    func fly() {
        print("날아갑니다.")
    }
}

var aBird1 = Bird1(name: "새") // weight 속성 초기화 안됨
aBird1.weight // <------ 해당 변수에 접근하는 이 시점에 초기화 됨 (메모리 공간이 생기고 숫자가 저장됨)


/**
 주의점
 지연 저장 속성은 "선언시점에 기본값을 저장"해야함
 - 따라서, 생성자에게 초기화를 시키지 않기 때문에 "선언시점에 기본 값을 저장"해야함
 - 지연(lazy) 저장 속성 ---> 구조체, 클래스 동일
 - 값을 넣거나, 표현식(함수 실행문)을 넣을 수 있음(모든 형태의 표현식)
 - 함수호출 코드, 계산코드, 클로저 코드 등 모두 가능
 ----> 저장하려는 속성과 "리턴형"만 일치하면 됨
 - 지연 저장 속성으로 선언된 " 해당 속성" 의 초기화 지연.
 ----> 메모리 공간이 없다가 처음 접근하는 순간에 (해당 속성만) 개별적으로 초기화 됨
 */

/**
 - 지연 저장 속성을 사용하는 이유
 - 1) 메모리 공간을 많이 차지하는 이미지 등의 속성에 저장할 때, (반드시 메모리에 다 올릴 필요가 없으므로) 지연 저장 속성으로 선언함 (메모리 낭비 막기 위해)
 - 2) 다른 속성들을 이용해야 할 때 초기화 시점에 모든 속성들이 동시에 메모리 공간에 저장되므로 어떤 한가지 속성이 다른 속성에 접근할 수가 없다.
 - (그렇지만, 지연 저장 속성을 이용하는 경우 지연으로 저장된 속성은 먼저 초기화된 속성에 접근 할 수 있게 됨)
 
 */




//: [Next](@next)
