# Study_SwiftFromAllen
인프런 엘렌 스위프트 강좌 공부 노트   
링크: https://inf.run/53MU

    
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
    - 함수의 표기법, 함수의 타입표기 -> 델리데이트 함수? 
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
    

  
