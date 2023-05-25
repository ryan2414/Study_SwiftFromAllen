import UIKit


func calFactorial(_ idx: Int) -> Int {
    var value = 1
    
    for i in 1...idx {
        value *= i
    }
    
    return value
}

var sdf = calFactorial(3)
print(sdf)


//재귀함수
func factorialSelf(idx:Int) -> Int {
    if idx <= 1 {
        return 1
    }
    
    return idx * factorialSelf(idx: idx - 1)
}

factorialSelf(idx: 5)




