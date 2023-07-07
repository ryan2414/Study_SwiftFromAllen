//: [Previous](@previous)

import Foundation

//: [Next](@next)

func add(a: Int, b: Int) -> Int {
    let result = a + b
    return result
}

let _ = {(a: Int, b: Int) -> Int in
    let result = a + b
    return result
}


let aClosure1 = { (str: String) in
    return "Hello, \(str)"
}

let aClosure2: (String) -> String = { (str) in
    return "Hello, \(str)"
}

let aClosure3 = {
    print("This is a closure.")
}

let closureType4 = { str in
    return str + "!"
}
