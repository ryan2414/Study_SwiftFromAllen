import UIKit


//:## 옵셔널 타입
// 값이 없어도 되는 타입.
// nil - 값이 없음을 나타내는 키워드(실제 값이 없음이 아님)

// 옵셔널 타입 선언의 기본 규칙
// 1) nil 대입 가능
// 2) 자동 초기화(값을 넣지 않을 시 nil로 초기화)

let num1: Int? = 2 // 간편표기
let nim2: Optional<Int> = 0 // 정식문법

var num: Int?
var str: String? = "안녕하세요"

print(num)
print(str)

// 1) 강제로 값을 추출: 값이 있다는 것이 확실할때 사용
print(str!)

// 2) if문으로 nil이 아니라는 것 확인 후, 강제로 벗기기
if str != nil {
    print(str!)
}

// 3) 옵셔널 바인딩(if let 바인딩)
if let s = str {
    print(s)
}
// 실제 앱을 만들 때 guard let 바인딩 많이 사용
func doSomething(name: String?) {
    guard let n = name else { return }
    print(n)
}

doSomething(name: "Hello")

// 4)Nil-Coalescing 연산자를 사용하는 방법
// 옵셔널 타입에 대하여, 디폴트(기본)값을 제시할 수 있을 때 사용
// (직접 값을 벗겨서 사용하는 것은 아니고, 디폴트값 제시를 통해 옵셔널 가능성을 없애는 방법)
var serverName: String? = "홍길동"
var userName = serverName ?? "미인증사용자"

var hello = "인사하겠습니다. " + (str ?? "Say, Hi")
print(hello)

str = nil
print(str ?? "Say, Hi")

//:## 옵셔널 체이닝
// 옵셔널타입에 대해 접근연산자를 사용하는 방법
class Dog {
    var name: String?
    var weight: Int
    
    init(name: String, weight: Int) {
        self.name = name
        self.weight = weight
    }
    
    func sit() {
        print("\(self.name!)가 앉았습니다.")
    }
    
    func layDown() {
        print("누웠습니다.")
    }
}

class Human {
    var dog: Dog?
}

// 옵셔널타입에 대해 "접근연산자"를 사용할 때, ?를 붙여서, 앞의 타입이 값이 nil을 가질 수도 있음을 표시
var choco = Dog(name: "초코", weight: 15)
choco.name
choco.sit()

var human: Human? = Human()
human?.dog = choco
human?.dog?.name
print(human?.dog?.name)

// 옵셔널 체이닝(옵셔널 타입에 대해, 접근연산자 호출방법)
// 1) 옵셔널체이닝의 결과는 항상 옵셔널이다.
// 2) 옵셔널체이닝에 값 중에서 하나라도 nil을 리턴한다면, 이어지는 표현식을 평가하지 않고 nil을 리턴

// 실제 사용시에는 결국, unwrapping해서 사용해야 함.
// 1) 앞의 옵셔널타입에 값이 있다는 것이 확실한 경우
print(human!.dog!.name) // name 자체가 옵셔널타입이기 때문에 Optional("초코")
print(human!.dog!.name!)
print(human!.dog!.weight) // weight 자체는 옵셔널타입이 아니기 때문에 15

// 2) if let 바인딩
if let name = human?.dog?.name {
    print(name)
}

// 3) Nil-Coalescing 연산자
var defaultName = human?.dog?.name ?? "멍탱구리"
print(defaultName)

// 활용 예시 - 옵셔널 체이닝(함수 관련 표기법)
class Cat {
    var name: String?
    var myMaster: (() -> Person?)?
    init(aFunction: @escaping () -> Person?) {
        self.myMaster = aFunction
    }
}

class Person {
    var name: String?
    
}

func meowmeow() -> Person? {
    let person = Person()
    person.name = "Jobs"
    return person
}

var cat: Cat? = Cat(aFunction: meowmeow)

var name = cat?.myMaster?()?.name
print(name)


// 옵셔널 체이닝 - 딕셔너리 관련 표기법
class Library {
    var books: [String: Person]?
}

var person1 = Person()
person1.name = "Jobs"
print(person1.name)

var person2 = Person()
person2.name = "Musk"
print(person2.name)

var library = Library()
library.books = ["Apple": person1, "Tesla": person2]

library.books?["Apple"]?.name!
library.books?["Tesla"]?.name!

// 1. books? ---> 딕셔너리 자체가 없을 수 있음을 의미
// 2. books?["Apple"]? ---> 딕셔너리의 결과값이 없을 수 있음을 의미


// 옵셔널 체이닝에서 함수의 실행은?

// 옵셔널 타입에 접근해서 사용하는 함수는 앞의 타입을 벗기지 않아도 사용가능
// (함수 자체가 옵셔널 타입은 아니기 때문에 함수를 벗겨서 사용할 필요가 없음)

// 1) 함수가 리턴형이 없는 경우
//  (1) 타입에 값이 있으면 함수 실행
//  (2) 타입에 값이 없으면 nil
// 2) 함수가 리턴형이 있는 경우
//  (1) 타입에 값이 있으면 옵셔널 리턴 타입으로 반환 (원래 리턴형이 옵셔널이 아니더라도)
//  (2) 타입에 값이 없으면 nil로 반환

var bori: Dog? = Dog(name: "보리", weight: 20)

bori?.layDown()
bori?.sit()

bori = nil
bori?.layDown() // 타입의 값이 nil이면, 함수가 실행이 되지 않고 nil을 반환

// 옵셔널 체이닝에서 함수(메서드 실행)의 경우 크게 신경 쓰지 않고 호출하면 됨
// (옵셔널이라는 것은 변수 안의 값에 대한 문제일 뿐)

//:## 암시적 추출 옵셔널 - IUO 타입
// 타입 선언시에 !가 붙어있는 타입
// (특정상황에서) 벗겨질 준비가 되어있는 타입
// ---> 옵셔널 타입이 아닌 다른 변수에 담을 때, 자동으로 벗겨저서 저장이 됨

var number: Int! = 7    // 값을 저장하지 않을 때 nil로 초기화 됨
print(number)           //실제 사용시에 강제로 벗겨지는 건 아니다


// 암시적 추출 옵셔널타입: (제한적인 상황에서) 옵셔널 바인딩이 필요 없음
// 1) 옵셔널이 아닌 타입의 변수로 저장될 때, 자동으로 언래핑 됨
var num2: Int = number
print(num2)
// 2) 일반 변수에 복사해서 담으면 --> Int?
var num3 = number //형식추론을 사용하는 경우 자동으로 추출되지 않음
print(num3)

var num4 = number! // (명시적으로) 강제로 벗기거나, 옵셔널 바인딩도 가능
print(num4)


var name1: String! = "홍길동"
name1?.count // 값이 있는 경우에만 옵셔널 체이닝을 하지 않아도 되지만(값이 없을 땐 에러 발생)

//:## 연습
// 1) 일반적인 옵셔널 타입
let optionalString: String? = "String"
print(optionalString)

// 옵셔널 타입이 아닌 변수에 담으려면(벗겨서 담아야함)
let forcedString: String = optionalString!
print(forcedString)

// (1) 확인후, 강제로
if optionalString != nil {
    print(optionalString!)
}

// (2) if let 바인딩
if let undefiniteString = optionalString {
    print(undefiniteString)
}

// 2) IUO 타입
// (제한적인 상황에서) 벗겨질 준비가 되어있는 타입
let unwrappedString: String! = "string"
print(unwrappedString)

let nomalString: String = unwrappedString
print(nomalString)

// 일반적인 방법처럼 언래핑해서 사용해도 됨
if let definiteString = unwrappedString {
    print(definiteString)
}

//:## 암시적 추출 옵셔널의 사용
// 실제 앱 구현 시,
// 1) 스토리보드에서 IBOutlet 연결할 때, 실제 위와 같은 타입으로 자동으로 선언됨
// (옵셔널 체이닝. 즉, 접근연산자를 사용할때 ?를 사용하지 않아도 됨.)
// 2) API에서 IUO 타입으로 리턴하는 경우가 있음
// Int! 타입은 그냥 Int?타입으로 봐도 무방함(그렇기에 문법적으로 읽을 수 있기만 하면 됨)

// 실제 앰 구현시 IUO타입은 개발자가 실수할 가능성을 낮춰주는 역할
// 암시적 추출 옵셔널타입: 옵셔널 체이닝이 필요 없음

class MyViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        imageView.image = UIImage(systemName: "pencil")
        mainLabel.font = UIFont.boldSystemFont(ofSize: 18)
    }
}


//:## 함수와 옵셔널 타입의 사용
// 옵셔널 타입의 파라미터 사용

// 옵셔널 파라미터 사용 함수의 정의
// 일반적으로는 기본값까지 설정해서, 함수를 유연하게 사용하도록 함

func doSomePrint(with label: String, name: String? = nil) {
    print("\(label): \(name)")
}

doSomePrint(with: "레이블", name: "스티브 잡스")

doSomePrint(with: "레이블", name: nil)

doSomePrint(with: "레이블")

var numbe: Int? = 7
var hellow: String? = "안녕하세요"
var naem : String? = "홍길동"
var newNum: Double? = 5.5

print(numbe)
print(hellow)
print(naem)
print(newNum)

if let num = numbe {
    print(num)
}

if let hi = hellow {
    print(hi)
}

if let n = naem {
    print(n)
}

if let num = newNum {
    print(num)
}

func doPrint(say: String?) {
    guard let hi = say else { return }
    print(hi)
}

doPrint(say: hellow)
