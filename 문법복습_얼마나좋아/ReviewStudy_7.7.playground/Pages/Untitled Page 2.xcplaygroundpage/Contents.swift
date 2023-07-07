//: [Previous](@previous)

import Foundation

class Aclass {
    struct Bstruct {
        enum Cenum {
            case aCase
            case bCase
            
            struct Dstruct {
                
            }
        }
        
        var name: Cenum
    }
}

let aClass: Aclass = Aclass()
let bStruct: Aclass.Bstruct = Aclass.Bstruct(name: .bCase)
let cEnum: Aclass.Bstruct.Cenum = Aclass.Bstruct.Cenum.aCase
let dStruct: Aclass.Bstruct.Cenum.Dstruct = Aclass.Bstruct.Cenum.Dstruct()



struct BlackjackCard {
    enum Suit: Character {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }
    
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        
        struct Values {
            let first: Int, second: Int?
        }
        
        var values: Values {
            switch self {
            case Rank.ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    
    let rank: Rank, suit: Suit
    
    var description: String {
        get {
            var output = "\(suit.rawValue) 세트,"
            output += " 숫자 \(rank.values.first)"
            
            if let second = rank.values.second {
                output += " 또는 \(second)"
            }
            
            return output
        }
    }
}

let card1 = BlackjackCard(rank: .ace, suit: .spades)
print("1번 카드: \(card1.description)")

let card2 = BlackjackCard(rank: .five, suit: .diamonds)
print("2번 카드: \(card2.description)")

let heartSymbol: Character = BlackjackCard.Suit.hearts.rawValue

let suit = BlackjackCard.Suit.hearts





let fomatter = DateFormatter()
fomatter.dateStyle = .full
fomatter.dateStyle = DateFormatter.Style.none

let setting1: DateFormatter.Style = DateFormatter.Style.full
let setting2: DateFormatter.Style = DateFormatter.Style.medium


//: [Next](@next)
