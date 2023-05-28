//
//  main.swift
//  RandomBingo
//
//  Created by 이승재 on 2023/05/28.
//

import Foundation

var computerChoice = Int.random(in: 1...100)

var myChoice = 0

while true {
    let userInput = readLine()

    if let input = userInput {
        if let number = Int(input) {
            myChoice = number
        }
    }

    //print(myChoice)

    if computerChoice > myChoice {
        print("Up")
    } else if computerChoice < myChoice {
        print("Down")
    } else {
        print("Bingo")
        break
    }
}


