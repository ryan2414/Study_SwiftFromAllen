//: [Previous](@previous)

import Foundation


var some: Any = "Swift"

(some as! String).count
some = 10
some = 3.2


class Person {
    var name = "이름"
    var age = 10
}

class Superman {
    var name = "이름"
    var weight = 100
}

let array: [Any] = [5, "안녕", 3.5, Person(), Superman(), {(name: String) in return name}]

(array[1] as! String).count


let objArray: [AnyObject] = [Person(), Superman(), NSString()]

(objArray[0] as! Person).name

for (index, item) in array.enumerated() {
    switch item {
    case is Int:
        print("Index - \(index): is Int")
    case let num as Double:
        print("Index - \(index): is Double")
    case is String:
        print("Index - \(index): is String")
    case let person as Person:
        print("Index - \(index): is Person()")
        print("Name is \(person.name)")
        print("age is \(person.age)")
    case is (String) -> String:
        print("Index - \(index): is closer type")
    default:
        print("Index - \(index): other type")
    }
}


let optionalNumber: Int? = 3
print(optionalNumber)
print(optionalNumber as Any)

//: [Next](@next)
