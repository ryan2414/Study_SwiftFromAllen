//: [Previous](@previous)

import Foundation

//: [Next](@next)

func closureParamFunction(closure: () -> ()) {
    print("프린트 시작")
    closure()
}

func printSwiftFunction() {
    print("프린트 종료")
}

let printSwift = { () -> () in
    print("프린트 종료")
}

closureParamFunction(closure: printSwiftFunction)

closureParamFunction(closure: printSwift)


closureParamFunction(closure: { () -> () in
    print("프린트 종료")
})

closureParamFunction(closure: {()->() in
    print("프린트 종료 - 1")
    print("프린트 종료 - 2")
})


func closureCaseFunction(a: Int, b: Int, closure: (Int) -> Void) {
    let c = a + b
    closure(c)
}

closureCaseFunction(a: 5, b: 2) { n in
    print("이제 출력할게요: \(n)")
}

closureCaseFunction(a: 5, b: 2) { (number) in
    print("출력할까요? \(number)")
}

closureCaseFunction(a: 5, b: 3) { number in
    print("출력")
    print("출력")
    print("출력")
    print("값: \(number)")
}


let print1 = {
    print("1")
}

let print2 = {
    print("2")
}

let print3 = {
    print("3")
}

func multiClosureFunction(closure1: () -> Void, closure2: () -> Void) {
    closure1()
    closure2()
}


multiClosureFunction(closure1: print1, closure2: print2)
multiClosureFunction(closure1: print2, closure2: print3)


multiClosureFunction(closure1: { print("1") }, closure2: { print("2") })

func performClosure(closure: () -> ()) {
    print("시작")
    closure()
    print("종료")
}

performClosure(closure: { print("중간") })
