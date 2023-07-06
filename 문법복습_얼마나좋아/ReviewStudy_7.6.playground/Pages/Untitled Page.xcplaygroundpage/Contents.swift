//: [Previous](@previous)

import Foundation

// 클래스의 지정, 편의 생성자 상속의 예외사항
// 클래스 생성자 자동 상속 규칙

// 지정생성자 자동상속의 예외 상황 -> 저장속성의 기본값 설정
/**
 - 새 저장 속성이 아예 없거나, 기본값이 설정되어 있다면(실패 가능성 배제)
 ------> 슈퍼 클래스의 지정생성자 모두 자동 상속(하위에서 어떤 재정의도 하지 않으면)
 */

// 편의생성자 자동상속의 예외 상황 -> 상위지정생성자 모두 상속
/**
 (초기화 실패 가능성 배제시) 자동 상속
 
 - (1) 지정 생성자 자동으로 상속하는 경우
 - (2) 상위 지정생성자 모두 재정의 구현 (실패 가능성 배제)
 
 - (결국, 모든 지정생성자를 상속하는 상황이 되면 편의생성자는 자동으로 상속됨)
 **/


class Food {
    var name: String
    
    init(name: String) {        // 지정 생성자
        self.name = name
    }
    
    convenience init() {        // 편의 생성자 ===> 지정 생성자 호출
        self.init(name: "[Unnamed]")
    }
}


let namedMeat = Food(name: "Bacon")
namedMeat.name

let mysteryMeat = Food()
mysteryMeat.name


// 상위의 지정생성자 ⭐️
// init(name: String)    지정생성자
// convenience init()    편의생성자


class RecipeIngredient: Food {
    var quantity: Int
    
    init(name: String, quantity: Int) {             // 모든 속성 초기화
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {       // 상위 지정생성자를 편의생성자로 재정의 ===> 지정생성자 호출
        self.init(name: name, quantity: 1)
    }
    
    // convenience init() { }      // 자동 상속 (예외 규칙)  (결국, 모든 지정생성자를 상속하는 상황이 되면 편의생성자는 자동으로 상속됨)
}

let oneMysteryItem = RecipeIngredient()
oneMysteryItem.name
oneMysteryItem.quantity

let oneBacon = RecipeIngredient(name: "Bacon")
oneBacon.name
oneBacon.quantity

let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
sixEggs.name
sixEggs.quantity



// 상위의 지정생성자 ⭐️
// init(name: String, quantity: Int)          지정생성자
// override convenience init(name: String)    편의생성자
// convenience init()                         편의생성자

class ShoppintListItem: RecipeIngredient {
    var purchased = false       // 모든 저장속성에 기본값 설정
    
    var description: String {
        var output = "\(quantity) * \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
    
    
    // init(name: String, quantity: Int) {}    // 지정생성자 모두 자동 상속
    
    // convenience init(name: String) {}       // 따라서 ====> 편의상속자도 모두 자동 상속됨
    
    // convenience init() {}                   // 따라서 ====> 편의상속자도 모두 자동 상속됨
    
}


var breakfastLinst = [
    ShoppintListItem(),
    ShoppintListItem(name: "Bacon"),
    ShoppintListItem(name: "Egg", quantity: 6)
]


breakfastLinst[0].name
//breakfastList[0].name = "Orange juice"
breakfastLinst[0].purchased = true



for item in breakfastLinst{
    print(item.description)
}



//: [Next](@next)
