//: [Previous](@previous)

import Foundation

protocol Remote {
    func turnOn()
    func turnOff()
}

extension Remote {
    func turnOn() {
        print("리모컨 켜기")
    }
    func turnOff() {
        print("리모컨 끄기")
    }
}

protocol Bluetooth {
    func blueOn()
    func blueOff()
}

extension Bluetooth where Self: Remote {
    func blueOn() { print("블루투스 켜기") }
    func blueOff() {
        print("블루투스 끄기")
    }
}

class SmartPhone: Remote, Bluetooth {
    
}

let sphone = SmartPhone()
sphone.turnOn()
sphone.turnOff()
sphone.blueOn()
sphone.blueOff()




//: [Next](@next)
