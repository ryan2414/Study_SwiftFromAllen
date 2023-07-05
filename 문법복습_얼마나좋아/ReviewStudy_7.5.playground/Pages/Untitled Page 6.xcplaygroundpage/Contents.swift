//: [Previous](@previous)

import Foundation

// 클래스의 상속과 초기화
// 1) 클래스의 상속
// 상속은 유일하게 클래스에게서만 지원하는 기능(구조체는 상속 불가능)
/**
 - 상속은 쉽게 말하면, 본질적으로 성격이 비슷한 타입을 새로만들어
 - 1) 데이터(저장속성)를 추가하거나
 - 2) 기능(메서드)를 변형시켜서 사용하려는 것
 */

class AClass {
    var name = "이름"
}

class BClass: AClass {
    var id = 0
}

let b = BClass()

// BClass는 AClass를 상속해서 구현
// 서브클래스는 슈퍼클래스로부터 멤버를 상속함

// 클래스의 상속 금지의 키워드 final
// (경우에 따라서, 클래스의 상속을 금지해야하는 경우가 있음)

// (final를 각 멤버 앞에 붙인 경우, 해당 멤버 재정의 불가라는 뜻)

// 기본적으로 상속은 데이터(저장 속성)을 추가하는 관점에서 생각
class Person {
    var id = 0
    var name = "이름"
    var email = "abc@gmail.com"
}

class Student: Person {
    var studentId = 0
}

class Undergraduate: Student {
    var major = "전공"
}

// 상위 클래스에서 존재하는 멤버를 변형하는 것을 재정의라고 함
// 재정의를 하려는 멤버에는 override 키워드를 붙여야함





//: [Next](@next)
