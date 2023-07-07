//: [Previous](@previous)

import Foundation

//: [Next](@next)

// Memory Leak

class Dog {
    var name = "초코"
    
    var run: (() -> Void)?
    func walk() {
        print("\(self.name)가 걷는다.")
    }
    
    func saveClosure() {
        run = {
            print("\(self.name)가 뛴다.")
        }
    }
    
    deinit {
        print("\(self.name) 메모리 해제")
    }
}

func doSomething() {
    let choco: Dog? = Dog()
    choco?.saveClosure()
}

doSomething()
