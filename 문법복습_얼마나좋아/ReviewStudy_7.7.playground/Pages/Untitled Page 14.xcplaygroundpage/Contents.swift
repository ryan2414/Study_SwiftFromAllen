//: [Previous](@previous)

import Foundation

// 에러를 던지는 함수를 처리하는 함수

enum SomeError: Error {
    case aError
}

func throwingFunc() throws {
    throw SomeError.aError
}

do {
    try throwingFunc()
} catch {
    print(error)
}

func handleError() {
    do {
        try throwingFunc()
    } catch {
        print(error)
    }
}

handleError()

//: [Next](@next)

func handleError1() throws {
    try throwingFunc()
}

do {
    try handleError1()
} catch {
    print(error)
}

func someFunction1(callback: () throws -> Void) rethrows {
    try callback()
}

func someFunction2(callback: () throws -> Void) rethrows {
    enum ChangedError: Error {
        case cError
    }
    
    do {
        try callback()
    } catch {
        throw ChangedError.cError
    }
}

do {
    try someFunction1(callback: throwingFunc)
} catch {
    print(error)
}

do {
    try someFunction2(callback: throwingFunc)
} catch {
    print(error)
}



enum NameError: Error {
    case noName
}

class Course {
    var name: String
    
    init(name: String) throws {
        if name == "" {
            throw NameError.noName
        } else {
            self.name = name
            print("수업을 올바르게 생성")
        }
    }
}

do {
    let _ = try Course(name: "")
} catch NameError.noName {
    print("이름이 없어 수업을 생성할 수 없습니다.")
}

// 생성자와 메서드의 재정의
class NewCourse: Course {
    override init(name: String) throws {
        try super.init(name: name)
    }
}


