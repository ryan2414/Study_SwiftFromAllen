import UIKit

// 0: 가위 1: 바위 2: 보
var comValue = Int.random(in: 0...2)
let myValue = 2//플레이그라운드는 readLine이 안된다...

print(comValue)
print(myValue)

if myValue == 0 {
    switch comValue {
    case 0:
        print("무승부입니다.")
    case 1:
        print("당신은 졌습니다.")
    case 2:
        print("당신은 이겼습니다.")
    default:
        print("Error")
    }
}
else if myValue == 1 {
    switch comValue {
    case 0:
        print("당신은 이겼습니다.")
    case 1:
        print("무승부입니다.")
    case 2:
        print("당신은 졌습니다.")
    default:
        print("Error")
    }
}
else if myValue == 2 {//보
    switch comValue {
    case 0:
        
        print("당신은 졌습니다.")
    case 1:
        print("당신은 이겼습니다.")
        
    case 2:
        print("무승부입니다.")
    default:
        print("Error")
    }
}


