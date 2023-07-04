//: [Previous](@previous)

import Foundation

// 2) 계산속성
// 밖에서 해당 인스턴스에 접근해서 "get" -> 값을 얻는다는 의미
class Person1 {
    var name: String = "사람"
    var height: Double = 160.0
    var weight: Double = 60.0
    
    var bmi: Double {
        get {
            let result = weight / (height * height) * 10000
            return result
        }
    }
}

let person1 = Person1()
person1.height = 165
person1.weight = 65

person1.bmi

/**
 - 항상 다른 저장 속성에 의한 결과로 계산해 나오는 그런 방식의 메서드인 경우
 - 아예 속성처럼 만들 수 있다. (---> 계산 속성)
 - 다른 속성의 계산의 결과로 나오는 속성
 */


// 밖에서 해당 인스턴스에 접근해서 "set" -> 값을 세팅(설정)한다는 의미

class Person2 {
    var name: String = "사람"
    var height: Double = 160.0
    var weight: Double = 60.0
    
    var bmi: Double {
        get {
            let bmi = weight / (height * height) * 10000
            return bmi
        }
        set(bmi) {
            weight = bmi * height * height / 10000
        }
    }
}

let person2 = Person2()
person2.height = 165
person2.weight = 65

person2.bmi
person2.bmi = 25

person2.weight

// 읽기만 가능한 계산속성은 get블록 생략 가능
class Person3 {
    var name: String = "사람"
    var height: Double = 160.0
    var weight: Double = 60.0
    
    var bmi: Double {
        let bmi = weight / (height * height) * 10000
        return bmi
        
    }
}

// set블록의 파라미터를 생략하고 'newValue'로 대체 가능
class Person4 {
    var name: String = "사람"
    var height: Double = 160.0
    var weight: Double = 60.0
    
    var bmi: Double {
        get {
            let bmi = weight / (height * height) * 10000
            return bmi
        }
        set {
            weight = newValue * height * height / 10000
        }
    }
}

/**
 - 메서드가 아닌, 속성방식으로 구현하면 무슨 장점이 있을까?

 - 관련이 있는 두가지 메서드를 한번에 구현할 수 있다.
 - 그리고 외부에서 보기에 속성이름으로 설정가능하므로 보다 명확해 보임
 - 따라서, 계산 속성은 메서드를 개발자들이 보다 읽기 쉽고, 명확하게 쓸 수 있는 형태인 속성으로 변환해 놓은 것이다.
 
 - 실제로, 계산 속성은 겉모습은 속성(변수)형태를 가진 메서드(함수)임
 - 계산 속성은 실제 메모리 공간을 가지지 않고, 해당 속성에 접근했을 때 다른 속성에 접근해서 계산한 후, 그 결과값을 리턴하거나 세팅하는 메서드이다.
 */

/**
 주의점
 - 1) 항상 변하는 값이므로, var로 선언해야함
 - 2) 자료형 선언을 해야함(형식 추론 형태 안됨)(메서드이기 때문에 파라미터, 리턴형이 필요한 개념)
 - 3) get은 반드시 선언해야함(값을 얻는 것은 필수, 값을 set하는 것은 선택)
 */



//: [Next](@next)
