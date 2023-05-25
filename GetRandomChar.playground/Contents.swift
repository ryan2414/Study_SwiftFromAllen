import UIKit


let word = "Hello"

func GetRandomChar(word: String) -> Character{
    let idx:Int = Int.random(in: 0..<word.count)
    let wordIndex = word.index(word.startIndex, offsetBy: idx)
    let selectedChar:Character = word[wordIndex]
    return selectedChar
}

GetRandomChar(word: word)

//string.index 굉장히 생소한 개념이다
//문자열에서 문자나 코드 유닛의 위치: 스위프트에서 문자열의 인덱스를 표현하기 위해 사용하는 특수한 타입이다.
//❗️ 스위프트의 String에서는 인덱스로 정수(Int)를 받지 않는다. 그 대신 String.Index를 사용하는 것이다.

//이런 간단한 메서드가 있네...
func chooseRandomChar(_ chars:String) -> String {
    return String(chars.randomElement()!)
}

chooseRandomChar("모범답안")
