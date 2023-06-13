import UIKit

var greeting = "Hello, playground"

//func swapCases(_ str: String) -> String {
//    var result = ""
//    for c in str {
//        let s = String(c)
//        let lo = s.lowercased()
//        let up = s.uppercased()
//        result += (s == lo) ? up : lo
//    }
//    return result
//}
//
//print(swapCases(greeting))


for i in 1...10 where i % 2 == 0 {
    print(i)
}
