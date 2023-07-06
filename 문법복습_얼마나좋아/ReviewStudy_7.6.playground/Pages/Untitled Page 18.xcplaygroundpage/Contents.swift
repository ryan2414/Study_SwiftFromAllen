//: [Previous](@previous)

import Foundation

//: [Next](@next)

@available(iOS 10.0, macOS 10.12, *)
class SomeType {
    
}

@objc protocol Remote {
    @objc optional var isOn: Bool {get set}
    func turnOn()
    func turnOff()
    @objc optional func doNetflix()
}

class TV: Remote {
    var isOn: Bool = false
    
    func turnOn() {
        
    }
    
    func turnOff() {
        
    }
    
}

let tv1: TV = TV()
print(tv1.isOn)

let tv2: Remote = TV()
print(tv2.isOn)
tv2.doNetflix?()
