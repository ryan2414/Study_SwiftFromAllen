import UIKit

/*:
# 앨런 - Swift 마스터 스쿨 22기
*/
/*:
## 세번째 테스트 (4주차)
---
*/
/**>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 그동안 배운 내용의 복습 및 약간의 응용이 들어가 있을 뿐입니다. 이 문제를 잘 풀 수 있다고
 좋은 개발자가 될 수 있는 것도 아니고, 실망하거나 좌절할 필요도 없습니다.
 우린 이제 시작일 뿐입니다. 😄
 가장 중요한 것은 포기하지 않고, 꾸준함을 유지하는 것일뿐!
 안풀리면, 다음 문제로 넘어가면되고, 이번에 못풀면 잘 공부해서, 다음 번에 똑같은 문제를 잘 풀면됩니다.
 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>**/

// 서술형의 경우, 주석처리를 하고 작성하면 됩니다.
// (시간이 약간 모자랄 수도 있을 것 같긴한데, 되는 대로 풀어서, 슬랙 DM으로 전달해 주세요!)

// 꼭 정해진 시간 이외에도 풀어보시는대로 전달해 주시면,
// 제가 대략적으로 실력을 파악하는데 도움이 됩니다. (조언도 드릴 수 있고요!)




/**==================================================================
 [1번 문제]
  - 함수 만들어 보기: 정수값을 한개 받아, 해당 정수가 짝수인지 여부를 판단하는 함수를
                  구현해 보세요. (힌트: 짝수 -> 참 / 홀수 -> 거짓)
 
    (함수 실행 예시)
    isEvenNumber(num: 3)    // 거짓
    isEvenNumber(num: 4)    // 참
 ===================================================================**/

// 함수 정의 (구현)


func isEvenNumber(num: Int) -> Bool {
    if num % 2 != 0 {
        return false
    }
    return true
}






// 함수 실행 (아래 주석 제거하고 실행해보기)

print("1번문제 결과 (1):", isEvenNumber(num: 3))
print("1번문제 결과 (2):", isEvenNumber(num: 4))





/**==================================================================
 [2번 문제]
  - Array(배열), Dictionary(딕셔너리), Set(집합)의 각각의 중요 특징과 차이점에 대해
    서술하고 간단한 예시 코드를 작성해 보세요.
 ===================================================================**/

// 1) 배열(Array)
// 인덱스로 이루어진 컬랙션
var arr = [1, 2, 3, 4, 5]



// 2) 딕셔너리(Dictionary)
// 키와 값으로 이루어진 컬랙션
var dic = ["a":"hello", "b":"xin chao", "c":"안녕하세요"]



// 3) 집합(Set)
// 중복을 허용하지 않는 컬랙션
var set: Set = [1, 1, 2, 2, 2]

print(set)







/**==================================================================
 [3번 문제]
  - 아래의 personName변수에 들어있는 값을 if let 바인딩으로 언래핑해서 이름을
    출력해 보세요.
 ===================================================================**/

class Person {
    var name: String? = "홍길동"
}


// 옵셔널 바인딩 코드 작성


if let personName = Person().name {
    print(personName)
}









/**==================================================================
 [4번 문제]
  - 아래의 a상수의 옵셔널 값을 switch문으로 이용해서 꺼내서 출력해 보세요.
    (힌트. some과, none 그리고, 연관값을 꺼내는 방법을 이용해 보세요.)
 ===================================================================**/


let a: Int? = 7


// (주석 해제하고) 나머지 전부 구현

switch a {
case .some(let num):
    print(num)
case .none:
    break
}





/**==================================================================
 [5번 문제]
  - 클래스나 구조체에서 initializer(생성자)의 역할이 무엇인가요? 간단하게 서술하세요.
 ===================================================================**/

// 클래스나 구조체를 인스턴스 할때 저장속성에 값을 할당하도록 하는 함수










/**==================================================================
 [6번 문제]
  - 구조체의 멤버와이즈 이니셜라이저(생성자)가 무엇인가요? 개념에 대해 간단하게
    서술하고, (자유롭게) 예제 코드를 만들어 설명해주세요.
    (힌트. Memberwise (멤버에 관한))
 ===================================================================**/

// 프로퍼티의 이름을 매개변수로 갖는 이니셜라이저이다.


struct Charector {
    var id: String
    var level: Int
    var job: String
    
}

var charector = Charector(id: "charles", level: 10, job: "Programmer")











/**==================================================================
 [7번 문제]
  - 클래스와 구조체의 근본적인 메모리 구조의 차이점에 대해서, 간단하게 설명해주세요.
    (힌트. Heap(힙)과 Stack(스택)을 참고적으로)
 ===================================================================**/

// 클래스의 경우 인스턴스 시 힙 영역에 생성됨
// 구조체의 경우 인스턴스 시 스택 영역에 생성.









/**==================================================================
 [8번 문제]
  - 클래스(또는 구조체)에서 계산 속성의 의미가 뭔가요?
  - 아래의 Person2 구조체에서 bmi라는 계산 속성을 구현해서, 쉽게 사람의 BMI를 계산하고
    값을 얻을 수 있게 구현해 보세요.
    (읽기/ 쓰기 속성을 모두 구현해 보세요)
 
    BMI지수 = 몸무게 / 키 x 키         (몸무게를 키의 제곱으로 나눈 값이 BMI)
            (kg기준) (키는 미터 기준)
 
 ===================================================================**/

struct Person2 {
    var name: String = "사람"
    var height: Double = 160.0
    var weight: Double = 60.0
    
    //bmi 계산 속성 구현해서 완성
    var bmi: Double {
        get {
            return weight / (height * height) * 10000
        }
        set {
            weight = bmi * height * height / 10000
        }
    }
}



// (계산 속성에 대한) 간단한 서술
// (계산속성의 의미, 역할, 필요한 이유 등을 간단하게)

// 내부에 가지고 있는 저장 속성값을 이용해, 계산한 후 결과값을 리턴한다.









/**==================================================================
 [9번 문제]
  - 클래스(또는 구조체)에서 속성 감시자의 의미가 뭔가요?
  - 아래의 Profile 클래스에서 message의 변수(속성)에 didSet 속성감시자를 구현해보세요.
    (didSet에서 아래의 메세지를 출력해 보세요.)
 
    print("메세지 - \(여기에뭘써야하죠)에서 \(message)로 변경됨")
 
    위의 문장을 복사해서 사용하세요.
 ===================================================================**/


class Profile {
    //var message: String = "기본메세지"   // 속성 감시자 구현

    var message: String {
        didSet(beforeMessage) {
            print("메세지 - \(beforeMessage)에서 \(message)로 변경됨")
        }
    }
    
    init() {
        message = "기본메세지"
    }

}




var p1 = Profile()

p1.message
p1.message = "행복하다"
p1.message




/**==================================================================
 [10번 문제]
  - 값타입(Value Type)과 참조타입(Reference Type)에 대해 아는대로 서술하고
    차이점에 대해서 설명해 보세요.
 ===================================================================**/


// 1) 값타입(Value Type)
// 함수에 인자를 전달할 때 값만 전달 하는 것 함수 안에서 변경된 값이 스코프 밖에 영향을 미치지 않음




// 2) 참조타입(Reference Type)
// 함수에 인자를 전달할 때 주소값을 전달한다. 함수 안에서 값이 변경되는 것이 스코프 밖에도 영향을 미침







/**==================================================================
 [11번 문제]
  - 객체지향 프로그래밍(OOP)의 4대 특징에 대해 나열하고, 간단하게 서술하세요.
 ===================================================================**/


//추상화, 캡슐화, 상속성, 다형성
//추상화 - 필요한 부문만을 추출하여 재조합 하는 것
//캡슐화 - 객체 외부에서 내부의 데이터에 접근, 통제를 하는 것
//상속성 - 부모클래스의 속성과 메서드를 자식 클래스에서 사용하는 것
//다형성 - 하나의 객체가 여러 타입의 형태로 저장 될수 있는 성질














/**==================================================================
 [12번 문제]
  - 아래의 코드 예제에서, Bclass는 Aclass를 상속하고 있습니다. Bclass의 저장속성인
    z를 고려해서, Bclass의 지정생성자를 한개이상 구현하고, 상위(Aclass)의 지정생성자
    (init(x: Int, y: Int))를 편의생성자로 재정의 해보세요.
    (자유롭게 구현해보세요.)
 ===================================================================**/


class Aclass {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    convenience init() {
        self.init(x: 0, y: 0)
    }
}



// 아래의 주석을 제거하고 코드를 구현

class Bclass: Aclass {

    var z: Int

    // 이 부분에 지정생성자 및 편의 생성자(상위의 지정생성자를 재정의해서) 구현
    init(x: Int, y:Int, z:Int){
        self.z = z
        super.init(x: x, y: y)
    }


}





/**==================================================================
 [13번 문제]
  - Singleton패턴이 무엇인가요? 아는 대로 간단하게 서술하고, (자유롭게) 간단한 예제 코드를
    작성해 보세요.
 ===================================================================**/


// 유일하게 한개만 존재하는 객체

class Text {
    static let shared = Text()
}











/**==================================================================
 [14번 문제]
  - 클래스의 타입 메서드의 구현에서, static 키워드와 class 키워드의 차이는 뭔가요?
    간단하게 서술하세요.
 ===================================================================**/


// static은 오버라이딩이 불가능 하고 class는 오버라이딩이 가능하다.











/**==================================================================
 [15번 문제]
  - mutating키워드가 뭔가요? 언제 사용했었죠? mutating키워드에 대해서 아는 대로
    간단하게 서술해 보세요.
 ===================================================================**/


// struct에서 함수가 구조체의 저장 속성을 변경할 때 적용한다.












/**==================================================================
 [16번 문제]
  - 아래에서, SomeSuperclass를 상속한 SomeSubclass에서.. 상위 클래스의
    aValue속성을 계산속성으로 자유롭게 재정의 해보세요.
    (계산 속성으로 재정의시 내부 구현은 자유입니다.)
 ===================================================================**/


class SomeSuperclass {
    var aValue = 0
}



class SomeSubclass: SomeSuperclass {

    // 계산속성으로 재정의 구현
    override var aValue: Int {
        get {
            return super.aValue
        }
        set {    // self로 쓰면 안됨
            super.aValue = newValue
        }
    }


}









/**>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 수고 하셨습니다. 😄
 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>**/
