//: [Previous](@previous)

import Foundation

// 3) 서브스크립트(배열, 딕셔너리에서 이미 경험)

/**
 - 대괄호를 이용해서 접근 가능하도록 만든 문법을 가르킴
 
 - 배열 array[인덱스]
 - 딕셔너리 dictionary[키]
 */

var array = ["Apple", "Swift", "iOS", "Hello"]

array[0]
array[1]

// 내부적으로 대괄호를 사용하면 어떤 값을 리턴하도록 구현이 되어 있어서 가능한 일

// 서브스크립트는 특별한 형태의 메서드
// 1) (인스턴스) 서브스크립트의 직접 구현 - 클래스, 구조체, 열거형

// 인스턴스 메서드로써의 서브스크립트 구현
class SomeData {
    var datas = ["Apple", "Swift", "iOS", "Hello"]
    
    subscript(index: Int) -> String {   // 1) 함수와 동일한 형태이지만, 이름은 subscript
        get {                           // 2) get / set은 계산속성에서의 형태와 비슷
            return datas[index]
        }
        set(parameterName) {
            datas[index] = parameterName// 또는 파라미터 생략하고 newValue로 대체 가능(계산 속성의 setter와 동일)
        }
    }
}

var data = SomeData()
data[0]


// 파라미터 생략 불가(값이 반드시 필요)
// 리턴형도 생략 불가(저장할 값의 타입 명시 필요)

// 읽기 전용(read-only)으로 선언 가능 (set 블록은 선택적으로 구현이 가능하고, 쓰기 전용으로는 선언 불가)

struct TimeTable {
    let multiplier: Int = 3
    
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimeTable = TimeTable()

print("6에 3배를 하면 숫자 \(threeTimeTable[6]) 이(가) 나옵니다.")



struct Matrix {
    var data = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
    
    // 2개의 파라미터를 받는 읽기전용 서브스크립트의 구현
    subscript(row: Int, column: Int) -> String? {
        if row >= 3 || column >= 3 {
            return nil
        }
        return data[row][column]
    }
}

var mat = Matrix()
mat[0, 1]!



// 2) 타입 서브스크립트 - 클래스, 구조체, (열거형)
enum Planet: Int { // 열거형의 원시값
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}

let mars = Planet[4]
print(mars)

// static 또는 class 키워드로 타입 자체의 서브스크립트 구현 가능
// class 상속시 재정의 가능

//: [Next](@next)
