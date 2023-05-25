import UIKit


func checkPrimeNumber(_ selectNum:Int) -> Bool{
    print("\(selectNum)은 ", terminator: "")
    var isPrime:Bool = true
    
    for i in 2..<selectNum {
        if selectNum % i == 0 {
            isPrime = false
        }
    }
    
    return isPrime
    
}

for i in 2...100 {
    if checkPrimeNumber(i) {
        print("소수입니다. ")
    }
    else{
        print("소수가 아닙니다.")
    }
    
}
