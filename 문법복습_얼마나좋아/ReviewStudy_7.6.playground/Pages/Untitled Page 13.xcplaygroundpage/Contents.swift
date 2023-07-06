//: [Previous](@previous)

import Foundation

// 프로토콜

protocol SomeProtocol {
    func playPiano()
}

struct MyStruct: SomeProtocol {
    func playPiano() {
        
    }
}

class MyClass: SomeProtocol {
    func playPiano() {
        
    }
}

// 클래스와 상속의 단점

class Bird {
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("새가 알을 낳는다.")
        }
    }
    
    func fly() {
        print("새가 하늘로 날아간다.")
    }
}

class Eagle : Bird {
    func soar() {
        print("공중으로 치솟아 오늘다.")
    }
}

class Penguin: Bird {
    // isFamale
    // layEgg()
    
    // fly()       // 상속 구조에서는 펭귄이 어쩔 수 없이 날개됨 ⭐️
    
    func swim() {
        print("헤엄친다.")
    }
}

class Airplane: Bird {
    
    // isFamale
    // layEgg()         // 상속 구조에서는 비행기가 알을 낳게됨 ⭐️
    
    override func fly() {
        print("비행기가 엔진을 사용해서 날아간다")
    }
}


struct FlyingMuseum {
    func flyingDemo(flyingObject: Bird) {
        flyingObject.fly()
    }
}


let myEagle = Eagle()
myEagle.fly()
myEagle.layEgg()
myEagle.soar()


let myPenguin = Penguin()
myPenguin.layEgg()
myPenguin.swim()
myPenguin.fly()     // 문제 ===> 펭귄이 날개 됨(무조건적인 멤버 상속의 단점)


let myPlane = Airplane()
myPlane.fly()
myPlane.layEgg()         // 문제 ===> 비행기가 알을 낳음



let museum = FlyingMuseum()     // 타입 정의 ===> 오직 Bird 클래스 밖에 안됨
museum.flyingDemo(flyingObject: myEagle)
museum.flyingDemo(flyingObject: myPenguin)
museum.flyingDemo(flyingObject: myPlane)    // Bird를 상속해야만 사용 가능





protocol CanFly {
    func fly()
}


class Bird1 {
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("새가 알을 낳는다.")
        }
    }
}


class Eagle1: Bird1, CanFly {
    func fly() {
        print("독수리가 하늘로 날아올라 간다.")
    }
    func soar() {
        print("공중으로 활동한다.")
    }
}

class Penguin1: Bird1 {
    
    // isFemale
    // layEgg()
    
    func swim() {
        print("물 속을 헤엄칠 수 있다.")
    }
}


// 구조체에서 채택도 가능
struct Airplane1: CanFly {
    func fly() {
        print("비행기가 날아간다")
    }
}



// 박물관을 만듦

struct FlyingMuseum1 {
    func flyingDemo(flyingObject: CanFly) {     // 중요한 기능 ===> 프로토콜을 타입으로 인식
        flyingObject.fly()
    }
}

let myEagle1 = Eagle1()
myEagle1.fly()
myEagle1.layEgg()
myEagle1.soar()


let myPenguin1 = Penguin1()
myPenguin1.layEgg()
myPenguin1.swim()
//myPenguin1.fly()     // 더이상 펭귄이 날지 않음


let myPlane1 = Airplane1()
//myPlane1.layEgg()         // 더이상 비행기가 알을 낳지 않음
myPlane1.fly()


let museum1 = FlyingMuseum1()
museum1.flyingDemo(flyingObject: myEagle1)
//museum1.flyingDemo(flyingObject: myPenguin1)   // 더이상 "CanFly"자격증이 없는 펭귄은 날지 못함
museum1.flyingDemo(flyingObject: myPlane1)




//: [Next](@next)
