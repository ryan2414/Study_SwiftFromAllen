//: [Previous](@previous)

import Foundation

//: [Next](@next)

let functionA: (String) -> String
let functionB: (Int) -> ()
let functionC: (String) -> Void

func aFunction(str: String) -> String {
    return "Hello, \(str)"
}

let _ = {(str: String) -> String in
    return "Hello, \(str)"
}


let aClosureType = { () -> () in
    print("안녕")
}

aClosureType()



func aFunction1(_ param: String) -> String {
    return param + "!"
}

func aFunction2(name: String) -> String {
    return name + "?!??"
}

var a: (String) -> String = aFunction1
a("안녕")

a = aFunction2
a("hello")

let closureType = { (param: String) -> String in
    return param + "!"
}

closureType("스티브")
