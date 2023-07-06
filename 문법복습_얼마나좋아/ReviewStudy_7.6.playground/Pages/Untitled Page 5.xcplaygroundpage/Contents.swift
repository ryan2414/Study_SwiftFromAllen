//: [Previous](@previous)

import Foundation

// 13 - 타입캐스팅

// 인스턴스 타입을 검사 - is 연산자
// 클래스 계층 상의 타입 변환 - as 연산자

// 상속: 기본적으로 데이터(저장 속성)를 추가하는 관점에서 생각

class Person {
    var id = 0
    var name = "이름"
    var email = "abc@gmail.com"
}

class Student: Person {
    var studentId = 1
}

class Undergraduate: Student {
    var major = "전공"
}

let person1 = Person()
person1.id
person1.name
person1.email

let student1 = Student()
student1.id
student1.name
student1.email
student1.studentId

let undergraduate1 = Undergraduate()
undergraduate1.id
undergraduate1.name
undergraduate1.email
undergraduate1.studentId
undergraduate1.major

// 인스턴스 타입을 검사하는 - is 연산자 (type check operator) - 타입에 대한 검사를 수행하는 연산자
/**
 - 인스턴스 is 타입 (이항연산자)
 > 참이면 true 리턴
 > 거짓이면 false 리턴
 
 
 - 상속관계의 계층에서 포함관계를 생각하면 쉬움
 **/


// 사람 인스턴스는 학생/대학생 타입은 아니다. (사람 타입이다.)
person1 is Person                // true
person1 is Student               // false
person1 is Undergraduate         // false



// 학생 인스턴스는 대학생 타입은 아니다.  (사람/학생 타입니다.)
student1 is Person               // true
student1 is Student              // true
student1 is Undergraduate        // false


// 대학생 인스턴스는 사람이거나, 학생이거나, 대학생 타입 모두에 해당한다.
undergraduate1 is Person         // true
undergraduate1 is Student        // true
undergraduate1 is Undergraduate  // true


// 예제를 통한 활용
let person2 = Person()
let student2 = Student()
let undergraudate2 = Undergraduate()

let people = [person1, person2, student1, student2, undergraduate1, undergraudate2]

// 학생의 인스턴스 갯수를 세고 싶다.

var studentNumber = 0

for someOne in people {
    if someOne is Student {
        studentNumber += 1
    }
}

print(studentNumber)





// 인스턴스 타입의 (메모리구조에 대한) 힌트를 변경하는 - as 연산자
/**
 - 타입캐스팅/ 타입캐스팅 연산자 (이항 연산자)
 (1) Upcasting (업캐스팅)
 - 인스턴스 as 타입
 - 하위클래스의 메모리구조로 저장된 인스턴스를 상위클래스 타입으로 인식
 
 (2) Downcasting (다운캐스팅) (실패가능성이 있음)
 - 인스턴스 as? 타입 / 인스턴스 as! 타입
 > as? 연산자
 - 참이면 반환티입은 Optional 타입
 - 실패시 nil 반환
 > as! 연산자
 - 참이면 반환타입은 Optional타입의 값을 강제 언래핑한 타입
 - 실패시 런타임 오류
 
 [타입캐스팅의 의미]
 - 인스턴스 사용시에 어떤 타입으로 사용할지(속성/메서드) 메모리구조에 대한 힌트를 변경하는 것
 - 메모리의 값을 수정하는 것이 아님
 - (단순히 해당 타입의 인스턴스인 것처럼 취급하려는 목적)
 **/

let person: Person = Undergraduate()
person.id
person.name
person.email


// as?/ as! (다운캐스팅)

let ppp: Undergraduate? = person as? Undergraduate

if let ppp {
    ppp.name
    ppp.major
}
 
if let newPerson = person as? Undergraduate {
    print(newPerson.major)
}

let person3: Undergraduate = person as! Undergraduate
person3.major

let undergraduate2: Undergraduate = Undergraduate()
undergraduate2.id
undergraduate2.name
undergraduate2.studentId
undergraduate2.major


let person4 = undergraduate2 as Person
person4.id
person4.name

let str: String = "Hello"
let otherStr = str as NSString


//: [Next](@next)
