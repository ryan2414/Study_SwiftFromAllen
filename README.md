# Study_SwiftFromAllen
인프런 엘렌 스위프트 강좌 공부 노트   
링크: https://inf.run/53MU

## 2023.06.09
- 비동기(Async) - 기다리지 않음 vs 동기(Sync)

- DispatchQueue(GDC - Grand Centeral DispatchQueue)
- DispatchQueue.main -> 1번 쓰레드, 메인쓰레드 == 메인큐
- DispatchQueue.global -> 종류가 여러개, 기본설정: 동시, QoS 6개 
- DispatchQueue(label:"...") -> 기본설정: 직렬, 커스텀 가능
 
- 물리적인 Thread를 여러개의 소프트웨어적인 Thread로 만들 수 있음 => Thread Pool(OS에서 관리)

- 병렬(Parallel) - 물리적인 쓰레드 vs 동시성(Concurrency) - 소프트웨어적인 쓰레드
- 직렬(Serial) vs 동시(Concurrent)
    - 직렬: 다른 한개의 쓰레드, 순서가 중요한 작업
    - 동시: 다른 여러개의 쓰레드, 독립적이지만 유사한 여러개의 작업


## 2023.06.08
- 에러 처리 
    - 에러 정의
    - 에러가 발생할 수 있는 함수에 대한 정의
    - 에러가 발생할 수 있는 함수의 처리
- 에러를 처리하는 방법 - try / try? / try!
- defer 문
    - 스코프 내의 동작의 마무리를 특정하기 위해서 사용
    - 등록한 역순으로 실행
    - 일반적으로 하나의 디퍼문만 사용하는 것이 좋음
- 네트워크 통신의 이해 
    - query
    - RestAPI
    - iOS 데이터 요청의 4단계
        1. URL
        2. URLSession
        3. dataTask
        4. resume(시작)

## 2023.06.07 Zoom 수업
- 타입 변환 vs 타입 캐스팅
- 타입애일리어스 -> 타입을 길게 쓰기 불편할 경우(like 별칭) 
- 변수에 담기는 것은 "데이터"이다. 
- 변수의 사용 
    - 읽기(get) 
        - 메모리에 어떤 값이 있는지 얻어 오는것 / 
    - 쓰기(set)
        - 메모리에 값을 할당하는 것
- 프로그래밍의 기본 원리
    - 순차 / 조건 / 반복 + 데이터
    - 순차 - 개발자가 정한 규칙에 따라 순차적으로 실행된다. 
    - 조건 - 조건에 따라 어떤 동작을 할지 말지의 여부
    - 반복
- 튜플 
    - 여러개의 데이터를 하나의 변수에 담는 것
    - 간단한 경우 사용

## 2023.06.07 - 흠냐 어렵다
- 클로저와 메모리 관리
- 캡쳐현상 & 캡쳐리스트
- 일반적인 클로저 사용   
    - 객체 내에서의 사용, self 키워드
    - `self` 키워드 사용 

- 강한 참조 사이클(객체가 서로를 참조) -> 메모리 누수 가능 
- 해결방안
    - 약한 참조
    ```Swift
    weak var pet:Dog?
    ```
    - 비소유 참조
        - 비소유 참조의 경우, 참조하고 있던 인스턴스가 사라지면, nil로 초기화 되지 않음 => 에러 발생 
        - 에러가 발생하지 않게 하려면, nil로 재설정 필요
    ```Swift
    unowned var owner: Person1?
    ```
    
## 2023.06.06
- 스위프트 메모리 관리 모델
- ARC(Automatic Reference Counting)
- RC(참조 숫자)를 세는 것을 통해, 메모리 관리/ 컴파일시에 메모리 해제시점을 결정
- retain() 할당 => release() 해제
- 소유정책, 참조 카운팅

## 1차 스터디 준비
- switch
    - `case`에 `break`를 추가하지 않아도 자동으로 `case` 마다 `break` 됩니다.
    - `case`를 연속 실행하려면 `fallthrough` 키워드를 사용해야 한다.(`break` 되는 것을 무시할 수 있다.)
    - 매우 한정적인 값(`enum`, `bool`등)이 아닌 한 `default` 구문은 반드시 작성해야 한다.
- 튜플은 switch문과 자주 활용된다.
    - 튜플의 각 요소를 각각 상수/변수화 가능(바인딩 = 다른 변수/상수의 새로운 식별자로 할당한다.)
    ```Swift
    var num = 6

    switch num {
    case let a:      // let a = num
        print("숫자: \(a)")
    default:
        break
    }
    ```
    - 튜플과 와일드 카드를 이용해서 switch문에서 여러개의 값을 동시에 확인할 수 있다.
    ```Swift
    func getPoint(somePoint:(Int,Int)){
        switch somePoint{
        case (0, 0):
            print("\(somePoint) is at the origin")
        case (_, 0):
            print("\(somePoint) is on the x-axis")
        case (0, _):
            print("\(somePoint) is on the y-axis")
        case (-2...2, -2...2):
            print("\(somePoint) is inside the box")
        default:
            print("\(somePoint) is outside of the box")
        }
    }
    ```
    - where절을 추가하여 조건을 더욱 세분화 할 수 있다.
        1. for문, while문, switch문 등에서 조건을 추가하여 나타낼 수 있다.
        2. 프로토콜의 extension 같은 타입에도 조건을 추가 할 수 있다.
    ```Swift
    for i in 1...10 where i % 2 == 0 {
        print(i)
    }
    ```
    ```Swift
    switch coordinate {
    case let (x,y) where x == y :
        print("좌표는 (\(x),\(y)) 입니다.")
    default:
        breake
    }
    ```

## 2023.06.04
- 클로저 
    -  익명 함수
    ```Swift
    {()->Int in
        return...
    }
    ```
    -  함수는 1급 객체
        1. 함수를 변수에 할당 할 수 있다.
        2. 함수를 파라미터로 전달이 가능하다.
        3. (함수에서) 함수를 리턴할 수 있다. 
- self vs Self (=> 타입을 선언하는 위치에서 사용, 타입 속성/메서드에 지칭, 프로토콜에서 채택하려는 타입을 지칭 가능)
- 중첩 타입
- 메서드 디스패치

## 2023.06.01
- Protocols

## 2023.05.31
- Extensions
    - 확장의 장점:
    - 원본 소스 코드에 대한 액세스 권한이없는 유형을 확장하는 기능이 포함 (소급-모델링 retroactive modeling)
    - 예) Int, String, Double 등 애플이 미리 만들어 놓은 타입에 확장도 가능
    - 메서드 형태만 가능
    - 스위프트에서는 확장에서 구현한 메서드에 대한 재정의가 불가능 하지만 @objc 붙이면 가능
        - 스위프트와 오브젝트씨의 매서드 구현 로직이 좀 다름  
- Any, AnyObject 
    - AnyObject는 클래스 객체만 담을 수 있다. 
    - 타입 캐스팅이 필요
- is 연산자 / 업 캐스팅 as 연산자 (브릿징) / 다운 캐스팅 as? / as! 연산자
- Struct And Class 생성자 / 소멸자 비교
    - 구조체: 지정 생성자, 실패가능 생성자
    - 클래스: 지정 생성자, 편의 생성자, 필수 생성자, 실패가능 생성자, 소멸자  
    - 상속과 관련하여 클래스가 생성자가 더 많음

## 2023.05.30
- Struct And Class Properties
    - 저장(Stored), 지연(Lazy) 저장 속성
    - 계산 속성(Computed) - get; set;
    - 타입(Type) 속성 - static
    - 속성 감시자(Property Observers) - willSet/didSet 
        
## 2023.05.28
- Xcode 단축기
    - cmd + shift + y : 디버그창 활성화
    - cmd + shift + l : 라이브러리 창 활성화 
- #colorLiteral(


## 2023.05.27
- Copy-On-Write 최적화 
    - 코드상에서 값을 복사해서 담는다 하더라도, 실제 값이 바뀌기 전까지는 그냥 하나의 메모리 값을 공유해서 사용한다.
    ```
    var arr = [1,2,3,4,5]
    var subArr = arr[0...2] // 같은 메모리 공간 공유
    ```
- Enum 열거형 
    - 원시값(Raw Value)
    ```
    enum Alignment1: String {
    case left
    case center
    case right
    }
    //string은 기본값을 입력 안하면 키와 값이 같아짐
    let align = Alignment(rawValue: 0)    // 인스턴스 생성시 - 옵셔널타입으로 리턴 (실패가능)
    let leftValue = Alignment.center.rawValue     // 접근연산자를 통해 원시값 자체에도 접근가능
    ```
    - 연관값(Associated Values): 구체적인 추가정보를 저장하기 위해 사용
    ```
    enum Computer {
    case cpu(core: Int, ghz: Double)
    case ram(Int, String)
    case hardDisk(gb: Int)
    }
    // 개별케이스마다 저장할 형식을 따로 정의(자료형에 제한이 없음 / 튜플의 형태)
    ```
- enum 부분은 C#과 다른 부분이 좀 있어서 별도의 플레이그라운드 생성 후 코딩 연습. 자동완성은 C#이 편하넹 Tab 두번이면 잘 만들어 줬었는데 ㅋㅋ 
- @unknown 어트리뷰트
    - @unknown 키워드를 default블럭에 추가해둠
    - switch문에서 열거형의 모든 케이스를 다루지 않는 경우, 스위치문에서 모든 열거형의 케이스를 다루지 않았다고 경고를 통해 알려줌 ===> 개발자의 실수 가능성을 컴파일 시점에 알려줌
    - "Switch must be exhaustive"로 알려줌


## 2023.05.26
- Array
    ```
    // 1) 배열을 직접정렬하는 메서드  sort  (동사)
    // 2) 정렬된 새로운 배열을 리턴  sorted (동사ing/동사ed)
    arr.sort()   // 배열을 직접 정렬, 배열 자체를 정렬
    arr.sorted() // 오름차순 정렬, 정렬된 배열을 리턴
    
    
    // enumerated() ===> 열거된 것들을 Named 튜플 형태로 한개씩 전달
    for tuple in nums.enumerated() {
    print(tuple) //(offset: 0, element: 10)... 
    }
    ```
- Dictionary
    - Dictionary의 키 값은 Hashable 해야함.
    
    
## 2023.05.25
- 이전에 있던 폴더와 분리 
- 공부하면서 새롭게 알게된 점 Note 예정
- 배운것
    - 함수의 표기법, 함수의 타입표기 
    - 제어전송문
        - fallthrough: switch 문에서 사용, 아래 문장도 실행 
    - 함수 실행의 메모리 구조
        - 프로그램 실행시 코드영역에 함수 적재 됨
        - 함수 호출시 스택 영역에 함수 실행에 필요한 스택 프레임 생성
        - 메모리 영역 안에 반환 주소 있음. 함수 실행 완료 후 반환 주소로 임시 값 넘김.
        - 전역 변수는 데이터 영역에 저장된다.
        - 조건문 반복문은 함수 스택 프레임 안에 생성 될 뿐.
        - 함수의 파라미터는 기본적으로 CallbyValue
        - inout 키워드를 사용하여 주소값을 전달 가능(Call by Ref)
    - guard 문
        ```
        guard password.count >= 6 else {return false}
        ```
        - 예외처리에 사용
    - @어트리뷰트 키워드
        - @표시가 붙음, 속성, 1. 선언에 추가정보 제공, 2. 타입에 추가정보 제공
        - @discardableResult -> 함수의 결과값을 안 쓸 수도 있음 (_ = sayHello())
    - 옵셔널 타입: 임시적인 타입, 포장지를 한겹 싼다는 느낌, 초기값이 없으면 nil로 자동 초기화
    - nil: 값이 없음을 나타내는 키워드 (실제 값이 없음이 아님)
    - 옵셔널 바인딩(if let 바인딩): 바인딩이 된다면, 특정 작업을 진행
        ```
        var str: String? = "Hello"
        
        if let s = str{
            print(s)
        }
        ```
    - guard let 바인딩
        ```
        guard let name = optionalName else {return}
        ```
    - Nil-Coalescing 연산자
        ```
        var serverName: String? = "홍길동"
        var userName = serverName ?? "미인증사용자" //serverName이 nil이면 "미인증사용자" 저장
        ```
    - 옵셔널 체이닝
    - IUO 타입
    

  
