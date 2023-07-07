//: [Previous](@previous)

import UIKit

//: [Next](@next)

// @escaping 키워드

// @escaping 키워드는 클로저를 제거하지 않고 함수에서 탈출시킴(= 함수가 종료되어도 클로저가 존재하도록 함)
// ====> 클로저가 함수의 실행흐름(스택프레임)을 벗어날 수 있도록 함

func performEscaping1(closure: () -> ()) {
    print("프린트 시작")
    closure()
}

performEscaping1 {
    print("프린트 중간")
    print("프린트 종료")
}



var aSavedFunction: () -> () = { print("출력")}


func performEscaping2(closure: @escaping () -> ()) {
    aSavedFunction = closure
}


aSavedFunction()

performEscaping2(closure: { print("다르게 출력") })


aSavedFunction()

func performEscaping1(closure: @escaping (String) -> ()) {
    var name = "홍길동"
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      closure(name)
    }
}

performEscaping1 { str in
    print("이름 출력하기: \(str)")
}


// @autoclosure 키워드

func someFuction(closure: @autoclosure () -> Bool) {
    if closure() {
        print("참입니다.")
    } else {
        print("거짓입니다.")
    }
}

var num = 1

someFuction(closure: num == 1)

func someAutoClosure(closure: @autoclosure @escaping () -> String) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        print("소개합니다.: \(closure())")
    }
}

someAutoClosure(closure: "제니")
