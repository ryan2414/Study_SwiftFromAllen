import UIKit


//:# Part10 - 열거형
//:## 열거형
// 연관된 상수(케이스)들을 하나의 이름으로 묶은 자료형
// 케이스가 선택 가능한(한정된) 가짓 수로 정해져 있을 때
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

enum CompassPoint {
    case north, south, east, west
}

// 열거형을 사용하면 코드의 가독성과 안전성이 높아짐 --> 명확한 분기 처리 가능

//:* 열거형은 타입니다.
var today: Weekday = Weekday.monday
today = .tuesday

// 열거형의 원시값과 연관값
// 열거형의 원시값은 매칭되는 기본값(정수/문자열)을 정해, 열거형을 좀 더 쉽게 활용 가능
// 여러가지 형태로 원시값을 정의 가능 (Hashable한 Int/ String/ Character/ Double 등 가능)
enum Alignment: Int {
case left
case center
case right
}

enum Alignment1: String {
    case left = "L"
    case center = "C"
    case right = "R"
}

let align = Alignment(rawValue: 0) // 인스턴스 생성시 - 옵셔널 타입으로 리턴 (실패 가능)
let leftValue = Alignment.center.rawValue // 접근연산자를 통해 원시값 자체에도 접근 가능

Alignment1(rawValue: "C") // (가능하지만) 문자열 방식으로는 잘 사용하지는 않음
let centerValue = Alignment1.center.rawValue

//:* 원시값(Raw Values)의 활용
enum RpsGame: Int {
    case rock
    case paper
    case scissors
}

RpsGame(rawValue: 0)!
RpsGame(rawValue: 1)
RpsGame(rawValue: 2)


let number = Int.random(in: 0...100) % 3
print(RpsGame(rawValue: number))

// 옵셔널 값을 안전하게 벗겨서 사용
if let r = RpsGame(rawValue: 0) {
    print(r)
}


//:* 열거형의 연관값
// 열거형의 연관값은 구체적인 추가정보를 저장하기 위해 사용
enum Computer {
    case cpu(core: Int, ghz: Double)
    case ram(Int, String)
    case hardDisk(gb: Int)
}

// 각 케이스별로 상이한 특징이 있고, 그것을 저장, 활용할 필요가 있을 때
// 개별 케이스마다 저장할 형식을 따로 정의(자료형에 제한이 없음/ 튜플의 형태)
// 하나의 케이스에 서로 다른 연관값을 저장할 수 있음 --> 선언 시점이 아니라, 새로운 열거형 값을 생성할 때 저장

let myChip1 = Computer.cpu(core: 8, ghz: 3.5)
let myChip2 = Computer.cpu(core: 4, ghz: 2.0)

let myChip3 = Computer.ram(16, "DRAM")
let myChip4 = Computer.ram(4, "SRAM")
let myChip5 = Computer.ram(32, "DRAM")

let myChip6 = Computer.hardDisk(gb: 128)
let myChip7 = Computer.hardDisk(gb: 512)

//:* 원시값(Raw Values)과 연관값(Associated Values)의 차이
// 1) 자료형 선언 방식: 선언하는 위치가 다름
// 2) 선언 형식: (1) 원시값 --> 2가지 중 1가지 선택 / (2) 연관값 --> 튜플 형테로 형식 제한 없음
// 3) 값의 저장 시점: (원시값: 선언시점/ 연관값: 새로운 열거형 생성할 때)
// 4) 서로 배타적: 하나의 열거형에서 원시값과 연관값을 함께 사용하는 것은 불가능 함

//:* 연관값의 활용
var chip = Computer.cpu(core: 8, ghz: 2.0)

switch chip {
case .cpu(core: 8, ghz: 3.1):
    print("CPU 8코어 3.1GHz입니다.")
case .cpu(core: 8, ghz: 2.6):
    print("CPU 8코어 2.6GHz입니다.")
case .ram(32, _):
    print("32기가램 입니다.")
default:
    print("그 이외의 칩에는 관심이 없습니다.")
}

// 연관값을 가진 케이스를 패턴 매칭시키기
switch chip {
case let .cpu(core: a, ghz: b):
    print("CPU \(a)코어 \(b)GHz입니다.")
case let .ram(a, _):
    print("램 \(a)기가 램 입니다.")
case let .hardDisk(gb: gB):
    print("HardDisk \(gB)기가 용량입니다.")
}


//:# 옵셔널 타입에 대한 정확한 이해
/**==========================
 - 옵셔널 타입의 내부 구현
 
   enum Optional<Wrapped> {     // 제네릭 문법
       case some(Wrapped)
       case none
   }
============================**/

var num: Int? = 7
switch num {
case .some(let a):
    print(a)
case .none:
    print("nil")
}
// .none과 .nil은 완전히 동일
// .none는 명시적인 열거형으로 표현한 것이고, 일반적으로는 값이 없다는 의미의 nil 키워드를 사용

//:# 열거형과 switch문
// 열거형의 정의와 switch문을 통한 활용
// 열거형에 대한 구체적인 처리는 스위치문과 함께 쓸때, 사용성이 높아짐

enum LoginProvider: String {
    case email
    case facebook
    case google
}

let userLogin = LoginProvider.facebook

// 열거형은 한정된 사례로 만든 타입이고,
// 스위치문은 표현식에 대한 분기처리에 최적화
switch userLogin {
case .email:
    print("이메일 로그인")
case .facebook:
    print("페이스북 로그인")
case .google:
    print("구글 로그인")
}
// 특정한 경우 처리
if LoginProvider.email == userLogin {
    print("이메일 로그인")
}


//:# 열거형에 (연관값이 없고), 옵셔널 열거형의 경우
//:* 스위치문의 편의성 (열거형 case 패턴) - Enumeration Case Pattern

// 열거형의 선언
enum SomeEnum {
    case left
    case right
}

// 타입을 다시 옵셔널 열거형으로 선언
let x: SomeEnum? = .left
/**==================================================
 [SomeEnum?의 의미] 옵셔널 열거형
 
 - 값이 있는 경우 .some ===> 내부에 다시 열거형 .left /.right
 - 값이 없는 경우 .none ===> nil
=====================================================**/

// 원칙
switch x {
case .some(let value):
    switch value {
    case .left:
        print("왼쪽으로 돌기")
    case .right:
        print("오른쪽으로 돌기")
    }
case .none:
    print("계속 전진")
}

// 편의적 기능 제공
switch x {
case .some(.left):
    print("왼쪽으로 돌기")
case .some(.right):
    print("오른쪽으로 돌기")
case .none:
    print("계속 전진")
}

//:* 스위치문의 편의성
// 스위치문에서는 옵셔널 열거형 타입을 사용할 때, 벗기지 않아도 내부값 접근 가능
// 스위치문은 옵셔널 열거형 타입의 사용시, 편의성을 제공

switch x { // 예전에는 x! 라고 써줘야 했음 (스위치문에서 옵셔널 타입도 ok)
case .left:
    print("왼쪽으로 돌기")
case .right:
    print("오른쪽으로 돌기")
case .none:
    print("계속 전진")
}


//:# 열거형에 연관값이 있는 경우
//:* 1) 연관값이 있는 경우와 switch문 (열거형 case 패턴)

/**
 - 연관값이 있는 열거형의 활용(열거형 case 패턴)
 - 구체적 정보(연관값)를 변수에 바인딩(let/var 가능)하는 패턴
 
 [열거형 case 패턴]
 - case Enum.case(let 변수이름):
 - case let Enum.case(변수이름):
 
 [스위치문 뿐만 아니라, 조건문/ 반복문에서도 활용 가능]
 - 1) switch문
 - 2) if/ guard/ for-in/ while(필요한 경우)
 **/


// 연관값이 있는 열거형 - 구체적인 정보가 연관값에 들어 있음
// 구체적인 정보를 꺼내서 사용해야하는, 로직 구현의 문제와 연관

enum Computer1 {
    case cpu(core: Int, ghz: Double)
    case ram(Int, String)
    case hardDisk(gb: Int)
}

var chip1 = Computer1.cpu(core: 8, ghz: 3.1)

switch chip1 {
case .cpu(core: 8, ghz: 3.1):
    print("CPU 8코어 3.1GHz입니다.")
case .cpu(core: 8, ghz: 2.6):
    print("CPU 8코어 2.6GHz입니다.")
case .cpu(core: 4, ghz: let ghz):
    print("CPU 4코어 \(ghz)HGz입니다.")
case .cpu(core: _, ghz: _):
    print("CPU 칩 입니다.")
case .ram(32, _):
    print("32기가램 입니다.")
case .ram(_, _):
    print("램 입니다.")
case let .hardDisk(gb: gB): // let gB = 연관값
    print("\(gB)기가 바이트 하드디스크 입니다.")
default:                    // 대부분 default문이 필요하기도 함
    print("그 외에 나머지는 관심이 없습니다.")
}

// 연관값을 가지고 있는 열거형의 경우, 원하는 로직으로 잘 정의해서 처리해야 하는 것에 주의

//:* 연관값이 있는 경우, if/ guard/ for-in/ while문 (열거형 case패턴)
// 값 하나를 사용하기 위해서, 스위치문을 전체를 다 써야하는 불편함이 있었음
switch chip1 {
case Computer1.hardDisk(gb: let gB):
    print("\(gB)기가 바이트 하드디스크임")
default:
    break
}

// 특정 케이스만 다루기 위해서 if문이나 반복문(for문) 사용 가능
chip1 = Computer1.hardDisk(gb: 256)

// if문에서도 스위치문에서 사용하는 case문과 같이 사용 가능
if case Computer1.hardDisk(gb: let gB) = chip1 {
    print("\(gB)기가 바이트 하드디스크임")
}

if case Computer1.hardDisk(gb: let gB) = chip1, gB == 256 {
    print("256기가 바이트 하드디스크임")
}

let chipLists: [Computer] = [
    .cpu(core: 4, ghz: 3.0),
    .cpu(core: 8, ghz: 3.5),
    .ram(16, "SRAM"),
    .ram(32, "DRAM"),
    .cpu(core: 8, ghz: 3.5),
    .hardDisk(gb: 500),
    .hardDisk(gb: 256)
]

for case let .cpu(core: c, ghz: h) in chipLists { // 배열 중에서 특정 케이스만 뽑아서 활용 가능
    print("CPU칩: \(c)Core \(h)GHz")
}

// 일반 for문과 비교 --> 모든 경우
for chip in chipLists {
    print("\(chip)")
}

//:* 열거형 케이스 패턴(for문) - 옵셔널 타입 요소 배열
// 옵셔널 타입을 포함하는 배열에서 반복문을 사용하는 경우
let arrays: [Int?] = [nil, 2, 3, nil, 5]
for case .some(let number) in arrays {
    print("Found a \(number)")
}


// 옵셔널 패턴
// 옵셔널 타입에서 열거형 케이스 패턴을 더 간소화한 옵셔널 패턴
// 열거형 내부에 "연관값"을 사용시 -> 1) 열거형 케이스 패턴 2) 옵셔널 패턴

let a: Int? = 1
// 1) 열거형 케이스 패턴
switch a {
case .some(let z):
    print(z)
case .none:
    print("nil")
}
// 2) 옵셔널 패턴
switch a {
case let z?: //.some를 조금 더 간소화한 문법
    print(z)
case nil: //.none라고 써도 됨
    print("nil")
}

// 옵셔널 패턴의 사례
// 옵셔널타입으로 선언
let num1: Int? = 7
print(num1)

// 1) 열거형 케이스 패턴
switch num1 {
case .some(let x):
    print(x)
case .none:
    break
}

// 2) 옵셔널 패턴 (.some을 ?로 대체 가능한 패턴)
switch num1 {
case let x?:
    print(x)
case .none:
    break
}

// 특정 사례만 다루는 (if문)
// 1) 열거형 케이스 패턴
if case .some(let x) = num1 {
    print(x)
}

// 2) 옵셔널 패턴(.some를 ?로 대체 가능한 패턴)
if case let x? = num1 { //?물음표를 띄어내고, x 상수로 보자으미?
    print(x)
}


// 옵셔널 패턴(for문) - 옵셔널타입 요소 배열
// 옵셔널 타입을 포함하는 배열에서 반복문을 사용하는 경우, 옵셔널 패턴을 사용하면 편리함
let arrays1: [Int?] = [nil, 2, 3, nil, 5]

// 1) 열거형 케이스 패턴
for case .some(let number) in arrays1 {
    print("Found a \(number)")
}

// 2) 옵셔널 패턴
for case let number? in arrays {
    print("Found a \(number)")
}


// =====================================================================================
// @unknown 키워드
// 만약, 열거형의 케이스가 늘어난다면 항상 올바른 처리를 하고 있다고 말할 수 있을까??
// 만약 로그인 경우의 수가 늘어난다면(Non-Forzen 열거형)
enum LoginProvider1: String { // 3가지 케이스 --> 4가지 케이스
    case email
    case facebook
    case google
    case kakaoTalk
}

let userLogin1 = LoginProvider.email

// 스위치문은 (특히, 열거형) 표현식에 대한 분기처리에 최적화
// (다만, 열거형의 케이스가 늘어나는 경우에 대한 안정성 보장은 별개)

switch userLogin1 {
case .email:
    print("이메일 로그인")
case .facebook:
    print("페이스북 로그인")
//case .google:
//    print("구글 로그인")
default:                    //default 블럭만 추가해두는 것이 안전할까?
    print("구글 로그인")
}

// 처리하는 로직이 항상 옳다는 보장을 하지 못함
// 에러는 나지 않을 수 있지만, 로직이 옳다고 할 수 없음

/**===================================================
 - @unknown 키워드를 default블럭에 추가해둠
 
 - switch문에서 열거형의 모든 케이스를 다루지 않는 경우,
   스위치문에서 모든 열거형의 케이스를 다루지 않았다고
   경고를 통해 알려줌 ===> 개발자의 실수 가능성을 컴파일 시점에 알려줌
 
 - "Switch must be exhaustive"로 알려줌
 =====================================================**/

switch userLogin1 {
case .email:
    print("이메일 로그인")
case .facebook:
    print("페이스북 로그인")
case .google:
    print("구글 로그인")
@unknown default:                    //default 블럭만 추가해두는 것이 안전할까?
    print("구글 로그인")
}



// =====================================================================================
// Class와 Struct
// 1) Class

// 붕어빵틀 만들기
class Dog {
    var name = "강아지"
    var weight = 0
    
    func sit() {
        print("앉았습니다.")
    }
    
    func layDown() {
        print("누웠습니다.")
    }
}

// 붕어빵 찍어내기(객체의 생성)
var bori = Dog()

// 객체의 속성에 접근
bori.name
bori.name = "보리"
bori.name

bori.weight
bori.weight = 15
bori.weight

bori.sit()
bori.layDown()

// 2) 구조체
struct Bird {
    var name = "새"
    var weight = 0.0
    
    func fly() {
        print("날아갑니다.")
    }
}

var aBird = Bird()
aBird.name
aBird.name = "참새"
aBird.name

aBird.weight
aBird.weight = 0.3
aBird.weight

aBird.fly()

var bBird = Bird()


// 인스턴스의 속성에 접근

bBird.name
bBird.name = "참새2"
bBird.name

bBird.weight
bBird.weight = 0.35
bBird.weight

bBird.fly()

/**
 - 클래스와 구조체 둘다, 메모리에 찍어낸 것을 인스턴스라고 함
 - 인스턴스는 실제로 메모리에 할당되어 구체적 실체를 갖춘 것이라는 의미
 
 - 스위프트에서는 클래스의 인스턴스를 특별히 객체라고 부름
 
 - 클래스의 인스턴스(객체)
 - 구조체의 인스턴스
 - 열거형의 인스턴스
 
 - 가장 큰 차이는 메모리 저장 방식의 차이
 - 1) 구조체
        1. 값형식(Value Type)
        2. 인스턴스 데이터 모두 스택에 저장
        3. (복사시) 값을 전달할때마다 복사본 생성(다른 메모리 공간 생성)
        4. 스택의 공간에 저장, 스택 프레임 종료시, 메모리에서 자동 제거
 - 2) 클래스
        1. 참조형식(Reference Type)
        2. 인스턴스 테이터는 힙에 저장. 해당 힙을 가르키는 변수는 스택에 저장하고
        3. 메모리 주소값이 힙을 가르킴
        4. (복사시) 값을 전달하는 것이 아니고, 저장된 주소를 전달
        5. 힙의 공간에 저장, ARC시스템을 통해 메모리 관리(주의해야함)

 **/


class Person {
    var name = "사람"
}

struct Animal {
    var name = "동물"
}

var p = Person()
p.name

var animal = Animal()
animal.name

var person2 = p

p.name = "혜리"

p.name
person2.name


var animal2 = animal
animal.name = "강아지"

animal.name
animal2.name


// 클래스와 구조체의 let과 var 키워드

class PersonClass {
    var name = "사람"
    var age = 0
}

struct AnimalStruct {
    var name = "동물"
    var age = 0
}

let pclass = PersonClass()
let astruct = AnimalStruct()

pclass.name = "사람1"
pclass.name

// 접문법/ 명시적 멤버 표현식의 정확한 의미
// 내부의 요소. 즉, 클래스, 구조체의 인스턴스의 멤버에 접근한다.
// 멤버는 속성, 메서드를 포함

