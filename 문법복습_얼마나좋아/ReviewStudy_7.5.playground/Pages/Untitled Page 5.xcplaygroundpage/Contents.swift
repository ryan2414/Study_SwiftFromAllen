//: [Previous](@previous)

import Foundation


//싱글톤 패턴
/**
 - 앱 구현시에, 유일하게 한개만 존재하는 객체가 필요한 경우에 사용
 - (특정한 유일한 데이터/관리 객체가 필요한 경우)
 
 - 한번 생성된 이후에는 앱이 종료될때까지, 유일한 객체로 메모리 상주
 */

class Singleton {
    // 타입 프로퍼티(전역변수)로 선언
    static let shared = Singleton()
    private init() {}
    
    var userInfoId = 12345
    
}

// 변수로 접근하는 순간 lazy하게 동작하여, 메모리(데이터 영역)에 올라감
Singleton.shared

let object = Singleton.shared
object.userInfoId = 1234567

Singleton.shared.userInfoId

let object2 = Singleton.shared // 유일한 객체를 가르키는 것일뿐
object2.userInfoId

Singleton.shared.userInfoId


// private init() 설정으로 새로운 객체 추가적 생성이 불가하게 막는 것 가능

// 앱을 실행하는 동안, 하나의 유일한 객체만 생성되어서, 해당 부분을 관리
let screen = UIScreen.main // 화면
let userDefaults = UserDefaults.standard // 한번생성된 후, 계속 메모리에 남음!!
let application = UIApplication.shared // 앱
let fileManager = FileManager.default // 파일
let notification = NotificationCenter.default // 노티피케이션(특정 상황, 시점을 알려줌)





//: [Next](@next)
