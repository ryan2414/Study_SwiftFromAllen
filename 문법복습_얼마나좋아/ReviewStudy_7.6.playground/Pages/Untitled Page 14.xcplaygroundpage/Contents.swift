//: [Previous](@previous)

import Foundation


protocol RemoteMouse {
    var id: String { get }
    var name: String { get set }
    static var type: String { get set }
}

struct TV: RemoteMouse {
    var id: String = "456"
    var name: String = "삼성티비"
    static var type: String = "리모콘"
}

let myTV = TV()
myTV.id
myTV.name
TV.type

class SmartPhone: RemoteMouse {
    var id: String {
        return "777"
    }
    
    var name: String {
        get { "아이폰" }
        set { }
    }
    
    static var type: String = "리모콘"
}

class Ipad: RemoteMouse {
    var id: String = "777"
    var name: String = "아이패드"
    class var type: String {
        get { "리모컨" }
        set { }
    }
}
//: [Next](@next)
