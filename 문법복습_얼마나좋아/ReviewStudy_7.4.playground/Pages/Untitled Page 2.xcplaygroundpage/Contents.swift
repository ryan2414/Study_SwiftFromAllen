//: [Previous](@previous)

import Foundation


// 4) 속성 감시자(Property Observer)
class Profile {
    var name: String = "이름"
    
    // 저장속성 + 저장 속성이 변하는 시점을 관찰하는 메서드
    var statusMessage: String = "기본 상태메세지" {
        willSet(message) {
            print("메세지가 \(statusMessage)에서 \(message)로 변경될 예정입니다.")
        }
    }
}


let p = Profile()

p.name
p.name = "전지현"

p.statusMessage
p.statusMessage = "행복해"

p.statusMessage = "우울해"

// 기본적으로 "속성 감시자"라는 이름이지만, 성격은 메서드 -> 저장 속성 감시
// 저장 속성이 변하는 시점을 관찰
// 저장 속성이 변하는 순간 ---> 딸려있는 메서드가 호출됨
// willSet은 값이 저장되기 직전에 호출됨
// 속성 감시자는 새 값이 속성의 현재 값과 동일하더라도 속성 값이 설정 될 때마다 호출됨

// 속성감시자의 2가지 종류 - willSet/ didSet

class Profile1 {
    var name: String = "이름"
    
    var statusMessage: String {
        willSet(message) { // 바뀔 값이 파라미터로 전달
            print("메시지가 \(statusMessage)에서 \(message)로 변경될 예정입니다.")
            print("상태메세지 업데이트 준비")
        }
        didSet(message) { // 바뀌기 전의 과거값이 파라미터로 전달
            print("메시지가 \(message)에서 \(statusMessage)로 이미 변경되었습니다.")
            print("상태메세지 업데이트 완료")
        }
    }
    
    init(message: String) {
        self.statusMessage = message
    }
}

/**
 - 1) willSet은 값이 저장되기 직전에 호출됨
 - 2) didSet은 새 값이 저장된 직후에 호출됨
 */


let profile1 = Profile1(message: "기본 상태메세지")
profile1.statusMessage = "기분 좋아졌으"


/**
 - 클래스, 구조체, (열거형) 동일하게 적용
 
 - 어떤 속성이 변하는 시점을 알아차리도록 시점에 제약을 만드는 코드를 짜기는 어려움
 - > 그래서 실제 앱을 만들고 활용할때 좋은 수단
 
 - 일반적으로는 willSet 또는 didSet 중에서 한가지만 구현
 - (실제 프로젝트에서는 didSet을 많이 사용)
 */

// 파라미터의 생략 - oldValue / newValue

class Profile2 {
    var name: String = "이름"
    
    var statusMessage = "기본 상태메세지" {
        willSet {
            print("메시지가 \(statusMessage)에서 \(newValue)로 변경될 예정입니다.")
            print("상태메세지 업데이트 준비")
        }
        didSet {
            print("메시지가 \(oldValue)에서 \(statusMessage)로 이미 변경되었습니다.")
            print("상태메세지 업데이트 완료")
        }
    }
}

let p2 = Profile2()
p2.name
p2.name = "전지현"

p2.statusMessage
p2.statusMessage = "행복해"

/**
 - 속성 감시자가 왜 필요할까?
 
 - 변수 변하면, 변경 내용을 반영하고 싶을 때(업데이트)
 - (실제 프로젝트에서 쉽게 이해가 되는 부분임)
 
 - 예시) 상태메시지 변경
 */

/**
 - 주의점
 - 속성 감시자를 추가 가능한 경우
 - 1) 저장 속성(원래, 상속한 경우 둘다 가능)
 - 2) 계산 속성(상속해서 재정의하는 경우에만 가능) (단순 메서드 추가)
 
 - 계산 속성의 경우, 속성 감시자를 만드는 대신 계산 속성의  set블록에서 값 변경을 관찰할 수 있기 때문에(재정의(상속)이 아닌 본래의 계산 속성에는 추가 불가)
 - let(상수) 속성에는 당연히 추가 안됨 (값이 변하지 않으므로, 관찰할 필요가 없기 때문)
 - 지연저장 속성에 안됨 (스위프트 5.3이후 업데이트: 지연 저장 속성에도 속성 감시자 구현 가능)
 */

// 속성감시자의 동작의 매커니즘
// 실제 값의 변경이 일어나지 않아도, 값을 Set하는 작업을 하면 무조건 호출

// willSet / didSet 매커니즘

var x = 0

func willSetting(newValue: Int) {
    print(newValue)
}

func didSetting(oldValue: Int) {
    print(oldValue)
}

func setX(newX: Int) {
    willSetting(newValue: newX)
    let tempX = x
    x = newX
    didSetting(oldValue: tempX)
}

setX(newX: 5)
//: [Next](@next)
