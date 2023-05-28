//
//  ViewController.swift
//  DiceGame
//
//  Created by 이승재 on 2023/05/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgViewFirtst: UIImageView!
    @IBOutlet var imgViewSecond: UIImageView!
    
    var diceArray: [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnRollTapped(_ sender: UIButton) {
        //첫번째 이미지뷰의 이미지를 랜덤으로 변경
        //imgViewFirtst.image = diceArray[getRandomNum()]
        imgViewFirtst.image = diceArray.randomElement()//랜덤으로 엘리먼트를 가져오는 메서드가 있다!!!
        //두번째 이미지뷰의 이미지를 랜덤으로 변경
        //imgViewSecond.image = diceArray[getRandomNum()]
        imgViewSecond.image = diceArray.randomElement()
    }
    
    func getRandomNum ()-> Int {
        let idx = Int.random(in: 0...5)
        return idx
    }
}

