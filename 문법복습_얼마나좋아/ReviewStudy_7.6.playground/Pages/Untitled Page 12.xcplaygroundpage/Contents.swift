//: [Previous](@previous)

import Foundation

extension Int {
    enum Kind {
        case negative, zero, positive
    }
    
    var kind: Kind {
        switch self {
        case 0:
            return Kind.zero
        case let x where x > 0:
            return Kind.positive
        default:
            return Kind.negative
        }
    }
}

let a = 1
a.kind

let b = 0
b.kind

let c = -1
c.kind

Int.Kind.positive

let d: Int.Kind = Int.Kind.negative


func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}

printIntegerKinds([3, 19, -27, 0, -6, 0, 7])  


//: [Next](@next)
