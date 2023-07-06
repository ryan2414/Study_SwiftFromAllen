//: [Previous](@previous)

import Foundation

extension Int {
    subscript(num: Int) -> Int {
        var decimalBase = 1
        
        for _ in 0..<num {
            decimalBase *= 10
        }
        
        return (self / decimalBase) % 10
    }
}

12345[0]
12345[1]
12345[2]

12345[6]

//: [Next](@next)
