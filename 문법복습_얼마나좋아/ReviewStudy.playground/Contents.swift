import UIKit

//let chr: Character = "1"
//print(type(of: chr))

//let str = "123.4"
//let number = Int(str)  // 타입컨버전이 실패했을 때 ====> nil(값이 없음)이 리턴될 수 있다.
//print(number)

//let num: Int = Int(2.4)
//print(num)

//typealias Name = String
//let name: Name = "홍길동"
//
//typealias Something = (Int) -> String
//
//func someFunction(completionHandler: Something) {
//
//}

//:> 스위치문에서 바인딩
//let num = 7
//
//switch num {
//case let x:
//    print("숫자: \(x)")
//default:
//    break
//}
//
//switch num {
//case let x where x % 2 == 0:
//    print("짝수 숫자: \(x)")
//case let x where x % 2 != 0:
//    print("홀수 숫자: \(x)")
//default:
//    print("그 이외의 숫자")
//
//}

//:> 가위 바위 보

//var com = Int.random(in: 0...2)
//var me = 2
//
//switch com {
//case 0:
//    print("컴퓨터의 선택은 가위 입니다.")
//case 1:
//    print("컴퓨터의 선택은 바위 입니다.")
//case 2:
//    print("컴퓨터의 선택은 보 입니다.")
//default:
//    break
//}
//
//switch me {
//case 0:
//    print("나의 선택은 가위 입니다.")
//case 1:
//    print("나의 선택은 바위 입니다.")
//case 2:
//    print("나의 선택은 보 입니다.")
//default:
//    break
//}
//
//if com == me {
//    print("무승부 입니다.")
//} else if com == 0 && me == 1 {
//    print("당신이 이겼습니다.")
//} else if com == 1 && me == 2 {
//    print("당신이 이겼습니다.")
//} else if com == 2 && me == 0 {
//    print("당신이 이겼습니다.")
//} else {
//    print("당신이 졌습니다.")
//}


//:### 랜덤 빙고 게임 만들기
//var com: Int = Int.random(in: 1...10)
//var me: Int = 5
//
//if com > me {
//    print("up")
//} else if com < me {
//    print("down")
//} else {
//    print("Bingo")
//}

//:### 튜플
// 2개 이상의 연관된 값을 저장하는 복합 타입
//let twoNumbers: (Int,Int) = (1, 2)
// 멤버(데이터의 종류 및 개수)는 튜플을 만들 때 결정되므로 "추가/ 삭제" 불가

//twoNumbers.0

//let iOS = (language: "Swift", version: "5")
//iOS.language
//iOS.version

// 튜플의 분해
//let (language, version) = iOS
//language
//version

// 튜플의 매칭
//if iOS.0 == "Swift" && iOS.1 == "5" {
//    print("스위프트 버전 5입니다.")
//}
//
//if iOS == ("Swift", "5") {
//    print("스위프트 버전 5입니다.")
//}
//
//switch iOS {
//case ("Swift", "5"):
//    print("스위프트 버전 5입니다.")
//case ("Swift", "4"):
//    print("스위프트 버전 4입니다.")
//default:
//    break
//}


// 튜플의 바인딩
//var coordinate = (0, 5)
//
//switch coordinate {
//case (let distance, 0), (0, let distance):
//    print("X 또는 Y축 위에 위치하며, \(distance)만큼의 거리가 떨어져 있음")
//default:
//    print("축 위에 있지 않음")
//}
//
//coordinate = (5, 0)
//
//switch coordinate {
//case (let x, let y) where x == y:
//    print("(\(x), \(y))의 좌표는 y = x 1차함수의 그래프 위에 있다.")
//case let (x, y) where x == -y:
//    print("(\(x), \(y))의 좌표는 y = -x 1차함수의 그래프 위에 있다.")
//case let (x,y):
//    print("(\(x), \(y))의 좌표는 y = x, 또는 y = -x 그래프가 아닌 임의의 지점에 있다.")
//}

// 반복문
//for chr in "Hello" {
//    print(chr)
//    //print(chr, terminator: " ")
//}
//
//print()
//for num in (1...5).reversed() {
//    print(num)
//}
//
//print()
//for num in stride(from: 1, to: 15, by: 2){
//    print(num)
//}

//let range = stride(from: 1, to: 15, by: 2)
//for i in range {
//    print(i, terminator: " ")
//}
//
//print()
//
//let range1 = stride(from: 1, through: 15, by: 2)
//for i in range1 {
//    print(i, terminator: " ")
//}
//
//print()
//
//let range2 = stride(from: 10, through: 2, by: -2)
//for i in range2 {
//    print(i, terminator: " ")
//}

// 반복문을 중첩적으로 사용할때, 각 반복문에 이름을 붙여서, 가장 인접한 범위 이외의 반복문도 제어가능
//OUTER: for i in 0...3 {
//    print("OUTER \(i)")
//INNER: for j in 0...3 {
//    if i > 1 {
//        print(" j : ", j)
//        continue OUTER
//    }
//    print(" INNER \(j)")
//}
//}

//:## 함수
// Void 타입
//func sayHello() {
//    print("Hello, Swift!")
//}
//
//func sayHello1() -> Void {
//    print("Hello, Swift!")
//}
//
//func sayHello2() -> () {
//    print("Hello, Swift!")
//}

// 아규먼트 레이블
//func printName(first name: String) {
//    print("나의 이름은 \(name)입니다.")
//}
//
//printName(first: "뉴턴")
//
//// 아규먼트 레이블 사용 안하면
//func someFunction(first: Int, second: Int) {
//    print(first + second)
//}
//
//someFunction(first: 1, second: 2)
//
//// 아규먼트 레이블 사용하는 것의 이점 (일반적으로 함수를 사용할 때 더 명확하게 무엇을 요구하는지 알려 줄 수 있다.
//func someFunc(writeYourFirstNumber a: Int, writeYourSecondNumber b: Int) {
//    print(a + b)
//}
//
//someFunc(writeYourFirstNumber: 3, writeYourSecondNumber: 4)
//
//// 아규먼트 레이블을 생략해서 사용하는 것도 가능 (와일드카드 패턴)
//func addPrintFunc(_ firstNum: Int, _ secondNum: Int) {
//    print(firstNum + secondNum)
//}
//
//addPrintFunc(1, 2)
//
//// 가변 파라미터 - 함수의 파라미터에 정해지지 않은, 여러개의 값을 넣는 것도 가능
//func arthmeticAverage(_ numbers: Double...) -> Double {
//    var total = 0.0
//    for n in numbers {
//        total += n
//    }
//    return total / Double(numbers.count)
//}
//
//
//arthmeticAverage(1.5, 2.5, 3.5, 4.5)
//
//// 함수의 파라미터에 기본값(디폴트) 정하는 것도 가능
//func numFunction(num1: Int, num2: Int = 5) -> Int {
//    var result = num1 + num2
//    return result
//}
//
//numFunction(num1: 5)
//numFunction(num1: 5, num2: 4)


// 정의문
func doSomething() {
    print("출력")
}

func numberPrint(n num: Int) {
    
    if num >= 5 {
        print("숫자가 5이상입니다.")
        return
    }
    
    print("숫자가 5미만입니다.")
}

// 함수 안에 함수를 작성할 수도 있다.
// (함수 안에 있는 함수는 밖에서 사용이 불가능)


// 함수를 제한적으로 사용하고 싶을 때, 사용

func chooseStepFunction(backward: Bool, value: Int) -> Int {
    
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    
    
    if backward {
        return stepBackward(input: value)
    } else {
        return stepForward(input: value)
    }
    
}

func addPrintFunction(_ firstNum: Int, _ secondNum: Int) {
    print(firstNum + secondNum)
}


// 함수를 지칭하려는 경우, 함수를 어떻게 표기할까?
// 1) 개발자 문서를 읽을 때 필요
// 2) 함수를 지칭할 때 필요 (함수를 변수에 담거나)

// 함수의 표기법(함수를 지칭시)

// 1) 파라미터가 없는 경우, ()를 삭제
doSomething

// 2) 아규먼트 레이블이 있는 경우, 아규먼트 레이블까지를 함수의 이름으로 봄
numberPrint(n:)

// 3) 파라미터가 여러개인 경우, 콤마 없이 아규먼트 이름과 콜론을 표기
chooseStepFunction(backward:value:)

// 4) 아규먼트 레이블이 생략된 경우, 아래와 같이 표기
addPrintFunction(_:_:)

//:## 함수 타입의 표기
// 변수에 정수를 저장하는 경우에 타입 표기
var num: Int = 5

// 함수의 타입 표기 방법
var function1: (Int) -> () = numberPrint(n:)
var function2: (Int, Int) -> () = addPrintFunction(_:_:)

// 변수가 함수를 가르키도록 할 수 있음
function2(3, 5)


//:## 함수의 오버로딩
// 같은 이름의 함수에 매개변수(파라미터)를 다르게 선언하여, 하나의 함수 이름에 실제 여러개의 함수를 대응 시키는 것
// ===> 함수의 이름의 재사용

func doSomeThing(value: Int) {
    print(value)
}

func doSomeThing(value: Double) {
    print(value)
}

func doSomeThing(value: String) {
    print(value)
}

func doSomeThing(_ value: String) {
    print(value)
}

func doSomeThing(value1: String, value2: Int) {
    print(value1, value2)
}

doSomeThing(value: 5)

doSomeThing(value: 3.4)

doSomeThing(value: 3)

//:## inout 파라미터
// 함수 내의 파라미터는 기본적으로 값타입이고(복사되어 전달) 임시 상수이기 때문에 변경 불가 원칙

var num1 = 123
var num2 = 456

func swap(a:Int, b:Int) {
//    var c = a
//    a = b
//    b = c
}


func swap(a: inout Int, b: inout Int) {
    var temp = a
    a = b
    b = temp
}

// 함수 실행시에는 앰퍼샌드를 꼭 붙여야함
swap(a: &num1, b: &num2)

print(num1)
print(num2)

// 입출력 파라미터는 내부적으로 copy-in, copy-out 메모리 모델을 사용하지만, 실제 원본이 전달된다고 쉽게 생각하면 됨
// *copy-in, copy-out -> 값을 복사해서 함수 바디 내부로 전달하고, 함수가 종료될 때, 아규먼트로 전달한 변수에 복사됨(함수 바디 내부에서 외부로 복사되어 전달)

// inout 파라미터 사용시 주의점
// 1) 상수(let)나, 리터럴 전달하는 것 불가능
// 2) 파라미터 기본값 선언을 허용하지 않음
// 3) 가변파라미터로 선언하는 것은 불가능


//:## guard문
// 불만족하는 조건을 사전에 걸러내는 조건문
// if문을 만족하는 경우, 지속적인 들여쓰기로 인해 코드의 가독성이 안 좋아질 수 있음
// 1) else문을 먼저 배치 - 먼저 조건을 판별하여 조기 종료
// 2) 조건을 만족하는 경우 코드가 다음 줄로 넘어가서 계속 실행
// 3) 가드문에서 선언된 변수를 아래 문장에서 사용 가능


// 어트리뷰트 키워드 @
// 컴파일러에게 추가적인 정보를 제공하는 키워드
// 1) 선언에 추가 정보 제공
// 2) 타입에 추가 정보 제공

// @discardableResult
// return 값이 있지만 사용하지 않을 경우 사용
// 와일드카드 패턴 대신 사용
// _ = doSomething()

// Swift 5.2부터 사용 가능
@discardableResult
func sayHelloString() -> String {
    print("하이")
    return "안녕하세요"
}

