//: [Previous](@previous)

import Foundation


//: [Next](@next)

protocol RemoteControlDelegate {
    func channelUp()
    func channelDown()
}

class RemoteControl {
    var delegate: RemoteControlDelegate?
    
    func doSomething() {
        print("리모컨의 조작이 일어나고 있음")
    }
    
    func channelUp() {
        delegate?.channelUp()
    }
    
    func channelDown() {
        delegate?.channelDown()
    }
}

struct TV: RemoteControlDelegate {
    init(remote: RemoteControl) {
        remote.delegate = self
    }
    
    func channelUp() {
        print("TV의 채널이 올라간다.")
    }
    
    func channelDown() {
        print("TV의 채널이 내려간다.")
    }
}

let rc1 = RemoteControl()
let samsungTV = TV(remote: rc1)
//
//rc1.channelUp()
//rc1.channelDown()

class SmartPhone: RemoteControlDelegate {
    init(remote: RemoteControl) {
        remote.delegate = self
    }
    
    func channelUp() {
        print("스마트폰의 채널이 올라간다.")
    }
    
    func channelDown() {
        print("스마트폰의 채널이 내려간다.")
    }
}

let rc2 = RemoteControl()

let sonyTV = TV(remote: rc2)

rc2.channelUp()
rc2.channelDown()

let iphone = SmartPhone(remote: rc2)

rc2.channelUp()
rc2.channelDown()
