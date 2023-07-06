//: [Previous](@previous)

import Foundation


// 필수 생성자
class AClass {
    var x: Int
    required init(x: Int) {
        self.x = x
    }
}

// 클래스 생성자 앞에 required 키워드 사용시
// 하위 생성자는 반드시 해당 필수 생성자를 구현해야 함

class BClass: AClass {
    required init(x: Int) {
        super.init(x: x)
    }
}

// 하위 클래스에서 필수생성자를 구현할 때는, 상위 필수 생성자를 구현하더라도
// override 키워드가 필요없고, required 키워드만 붙이면 됨

// 필수 생성자 자동 상속 조건: 다른 지정 생성자 구현 안하면 -> 자동 상속
// (자동 상속 조건을 따르기 때문에, 다른 지정 생성자를 구현 안하면 자동으로 필수 생성자 상속됨)


class CClass: AClass {
    init() {
        super.init(x: 0)
    }
    
    required init(x: Int) {
        super.init(x: x)
    }
}

// init() 생성자를 구현하면, 자동 상속 조건을 벗어나기 때문에
// required init(x: Int) 필수생성자 구현해야 함

//: [Next](@next)
