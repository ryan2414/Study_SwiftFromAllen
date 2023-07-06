//: [Previous](@previous)

import Foundation

protocol Remote {
    func turnOn()
    func turnOff()
}

protocol AirConRemote {
    func Up()
    func Down()
}

protocol SuperRemoteProtocol: Remote, AirConRemote {
    func doSomething()
}

class HomePot: SuperRemoteProtocol {
    func doSomething() {
        
    }
    
    func turnOn() {
        
    }
    
    func turnOff() {
        
    }
    
    func Up() {
        
    }
    
    func Down() {
        
    }
}

protocol SomeProtocol: AnyObject {
    func doSomething()
}


//struct AStruct: SomeProtocol {
//
//}

class AClass: SomeProtocol {
    func doSomething() {
        print("Do something")
    }
}


protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy Birthday, \(celebrator.name), You are \(celebrator.age)")
}

let birthdayPerson = Person(name: "홍길동", age: 20)
wishHappyBirthday(to: birthdayPerson)

let whoIsThis: Named & Aged = birthdayPerson



//: [Next](@next)
