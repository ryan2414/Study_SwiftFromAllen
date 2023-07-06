//: [Previous](@previous)

import Foundation


Int.random(in: 1...100)

extension Int {
    static func printNumbersFrom1to5() {
        for i in 1...5 {
            print(i)
        }
    }
}

Int.printNumbersFrom1to5()


extension String {
    func printHelloRepetitions(of times: Int) {
        for _ in 0..<times {
            print("Hello \(self)!")
        }
    }
}

"Steve".printHelloRepetitions(of: 4)


extension Int {
    mutating func squard() {
        self = self * self
    }
}

var someInt = 3
someInt.squard()
//: [Next](@next)
