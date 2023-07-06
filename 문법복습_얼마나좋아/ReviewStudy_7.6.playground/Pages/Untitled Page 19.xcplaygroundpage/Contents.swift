//: [Previous](@previous)

import Foundation

protocol Remote {
    func turnOn()
    func turnOff()
}

class TV1: Remote {
    
}

struct Aircon1: Remote {
 
}

extension Remote {
    func turnOn() { print("리모콘 켜기") }
    func turnOff() { print("리모콘 끄기") }
    
    func doAnotherAction() {
        print("리모컨 또 다른 동작")
    }
}

class Ipad: Remote {
    func turnOn() {
        print("아이패드 켜기")
    }
    
    func doAnotherAction() {
        print("아이패드 다른 동작")
    }
}

let ipad: Ipad = Ipad()
ipad.turnOn()
ipad.turnOff()
ipad.doAnotherAction()

let ipad2: Remote = Ipad()
ipad2.turnOn()
ipad2.turnOff()
ipad2.doAnotherAction()
//: [Next](@next)


struct SmartPhone: Remote {
    func turnOn() {
        print("스마트폰 켜기")
    }
    
    func doAnotherAction() {
        print("스마트폰 다른 동작")
    }
}

var iphone: SmartPhone = SmartPhone()
iphone.turnOn()
iphone.turnOff()
iphone.doAnotherAction()

var iphone2: Remote = SmartPhone()
iphone2.turnOn()
iphone2.turnOff()
iphone2.doAnotherAction()
