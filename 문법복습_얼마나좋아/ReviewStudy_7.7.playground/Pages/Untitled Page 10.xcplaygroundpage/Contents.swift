//: [Previous](@previous)

import Foundation

//: [Next](@next)

func closureParamFunction(closure: () -> Void) {
    print("프린트 시작")
    closure()
}


closureParamFunction(closure: {
    print("프린트 종료")
})

closureParamFunction(closure: ) {
    print("프린트 종료")
}

closureParamFunction() {
    print("프린트 종료")
}

closureParamFunction {
        print("프린트 종료")
}


func closureCaseFunction(a: Int, b: Int, closure: (Int) -> Void) {
    let c = a + b
    closure(c)
}

closureCaseFunction(a: 5, b: 2) { number in
    print("출력할까요? \(number)")
}





func performClosure(param: (String) -> Int) {
    param("Swift")
}

performClosure(param: { (str: String) in
    return str.count
})

performClosure(param: { str in
    return str.count
})

performClosure(param: { str in
    str.count
})

performClosure(param: {
    $0.count
})

performClosure() {
    $0.count
}

performClosure { $0.count }

let closureType1 = { (param) in
    return param % 2 == 0
}

let closureType2 = { $0 % 2 == 0 }

let closureType3 = { (a: Int, b: Int) -> Int in
    return a * b
}

let closureType4: (Int, Int) -> Int = { (a, b) in
    return a * b
}

let closureType5: (Int, Int) -> Int = { $0 * $1 }



func multipleClosure(first: () -> (), second: () -> (), third: () -> ()) {
    first()
    second()
    third()
}


multipleClosure {
    print("1")
} second: {
    print("2")
} third: {
    print("3")
}

func multipleClosure2(first: () -> (), _ second: () -> (), third: () -> ()) {
    first()
    second()
    third()
}

multipleClosure2 {
    print("1")
} _: {
    print("2")
} third: {
    print("3")
}


