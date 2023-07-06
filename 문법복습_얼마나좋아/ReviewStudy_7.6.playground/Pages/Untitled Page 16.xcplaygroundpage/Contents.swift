//: [Previous](@previous)

import Foundation


//: [Next](@next)

protocol Remote {
    func turnOn()
    func turnOff()
}

class TV: Remote {
    func turnOn() {
        print("TV켜기")
    }
    
    func turnOff() {
        print("TV끄기")
    }
}

struct SetTopBox: Remote {
    func turnOn() {
        print("셋톱박스켜기")
    }
    
    func turnOff() {
        print("셋톱박스끄기")
    }
    
    func doNetflix() {
        print("넷플릭스 하기")
    }
}

let tv = TV()
tv.turnOn()
tv.turnOff()

let sbox = SetTopBox()
sbox.turnOn()
sbox.turnOff()


let electronic: [Remote] = [tv, sbox]

for item in electronic {
    item.turnOn()
}


func turnOnSomeElectronics(item: Remote) {
    item.turnOn()
}

turnOnSomeElectronics(item: tv)
turnOnSomeElectronics(item: sbox)

tv is Remote
sbox is Remote

electronic[0] is TV
electronic[1] is SetTopBox

let newBox = sbox as Remote
newBox.turnOn()
newBox.turnOff()

let sbox2: SetTopBox? = electronic[1] as? SetTopBox
sbox2?.doNetflix()
