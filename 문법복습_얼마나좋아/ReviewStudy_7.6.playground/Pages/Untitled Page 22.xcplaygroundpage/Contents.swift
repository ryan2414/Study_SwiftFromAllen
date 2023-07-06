//: [Previous](@previous)

import Foundation

struct MyStruct {
    func method1() {
        print("Struct - Direct method1")
    }
    
    func method2() {
        print("Struct - Direct method2")
    }
}

let myStruct = MyStruct()
myStruct.method1()
myStruct.method2()

class FirstClass {
    func method1() {
        print("Class - Table method1")
    }
    
    func method2() {
        print("Class - Table method2")
    }
}

class SecondClass: FirstClass {
    override func method2() {
        print("Class - Table method2-2")
    }
    func method3() {
        print("Class - Table method3")
    }
}





let first = FirstClass()
first.method1()
first.method2()


let second = SecondClass()
second.method1()
second.method2()
second.method3()

//: [Next](@next)

class ParentClass {
    @objc dynamic func method1() {
        print("Class - Message method1")
    }
    @objc dynamic func method2() {
        print("Class - Message method2")
    }
}



class ChildClass: ParentClass {
    @objc dynamic override func method2() { print("Class - Message method2-2") }
    @objc dynamic func method3() { print("Class - Message method3") }
}



let child = ChildClass()
child.method1()
child.method2()
child.method3()

