//
//  ViewController.swift
//  UpDownGame
//
//  Created by 이승재 on 2023/05/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    
    var comNum = Int.random(in: 1...10)
    var myNum: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //메인레이블에 "선택하세요"
        mainLabel.text = "선택하세요"
        //숫자레이블 = ""
        numberLabel.text = ""
    }

    @IBAction func btnNumTapped(_ sender: UIButton) {
        //버튼의 숫자를 가져와야 함
        guard let numString = sender.currentTitle else { return }
       
        //numberLabel에 숫자에 따라 변화
        numberLabel.text = numString
        
        //선택한 숫자를 변수에다 저장
//        guard let num = Int(numString) else { return }
//        myNum = num
    }
    
    @IBAction func btnSelectTapped(_ sender: UIButton) {
        //숫자 레이블에 있는 문자열 가져오기
        guard let numString = numberLabel.text else { return }
        guard let num = Int(numString) else { return }
        
        if comNum > num {
            mainLabel.text = "Up"
        } else if comNum < num {
            mainLabel.text = "Down"
        } else {
            mainLabel.text = "Bingo😎"
        }
        
        //컴퓨터의 숫자와 내가 선택한 숫자를 비교
//        if comNum > myNum {
//            mainLabel.text = "Up"
//        } else if comNum < myNum {
//            mainLabel.text = "Down"
//        } else {
//            mainLabel.text = "Bingo😎"
//        }
        
    }
    
    @IBAction func btnResetTapped(_ sender: UIButton) {
        //메인레이블에 "선택하세요"
        mainLabel.text = "선택하세요"
        //숫자레이블 = ""
        numberLabel.text = ""
        //랜덤 숫자
        comNum = Int.random(in: 1...10)
    }
    
}

