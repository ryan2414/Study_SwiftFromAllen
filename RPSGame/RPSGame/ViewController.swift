//
//  ViewController.swift
//  RPSGame
//
//  Created by 이승재 on 2023/05/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lblMain: UILabel!
    @IBOutlet var imgviewCom: UIImageView!
    @IBOutlet var imgviewMy: UIImageView!
    @IBOutlet var lblComChoice: UILabel!
    @IBOutlet var lblMyChoice: UILabel!
    
    var myChoice: Rps = Rps.rock
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1. 이미지뷰들에 준비 이미지 활성화
        imgviewCom.image = #imageLiteral(resourceName: "ready")
        imgviewMy.image = UIImage(named: "ready.png")
        //2. 이미지뷰 아래 레이블에 "준비" 문자열 활성화
        lblComChoice.text = "준비"
        lblMyChoice.text = "준비"
        
    }
    
    @IBAction func btnRpsTapped(_ sender: UIButton) {
        // 가위/바위/보 선택해서 그 정보 저장해야됨
        guard let title = sender.currentTitle else {return}
        
        switch title {
        case "가위":
            //가위 열거형을 만들어서 저장
            myChoice = Rps.scissors
        case "바위":
            myChoice = Rps.rock
        case "보":
            myChoice = Rps.paper
        default:
            break
        }
    }
    
    @IBAction func btnSelectTapped(_ sender: UIButton) {
        // 컴퓨터가 랜덤 선택한 이미지 이미지 뷰에 표시
        // 컴퓨터가 랜덤 선택 레이블에 표시
        switch comChoice{
        case Rps.rock:
            imgviewCom.image = #imageLiteral(resourceName: "rock")
            lblComChoice.text = "바위"
        case Rps.paper:
            imgviewCom.image = #imageLiteral(resourceName: "paper")
            lblComChoice.text = "보"
        case Rps.scissors:
            imgviewCom.image = #imageLiteral(resourceName: "scissors")
            lblComChoice.text = "가위"
        }
        
        // 내가 선택한 것을 이미지뷰에 표시
        // 내가 선택한 것을 레이블에 표시
        switch myChoice{
        case Rps.rock:
            imgviewMy.image = #imageLiteral(resourceName: "rock")
            lblMyChoice.text = "바위"
        case Rps.paper:
            imgviewMy.image = #imageLiteral(resourceName: "paper")
            lblMyChoice.text = "보"
        case Rps.scissors:
            imgviewMy.image = #imageLiteral(resourceName: "scissors")
            lblMyChoice.text = "가위"
        }
        
        // 선택된 정보, 컴퓨터 선택한 것 비교 후 표시
        if comChoice == myChoice {
            lblMain.text = "비겼다."
        } else if (comChoice == .rock && myChoice == .paper) ||
            (comChoice == .paper && myChoice == .scissors) ||
            (comChoice == .scissors && myChoice == .rock) {
                lblMain.text = "이겼다."
            } else {
                lblMain.text = "졌다."
            }
    }
    @IBAction func btnResetTapped(_ sender: UIButton) {
        // 컴퓨터 이미지 초기화
        // 컴퓨터 레이블 초기화
        
        // 내가 이미지뷰 초기화
        // 내 레이블 초기화
        
        imgviewCom.image = #imageLiteral(resourceName: "ready")
        imgviewMy.image = UIImage(named: "ready.png")
        
        lblComChoice.text = "준비"
        lblMyChoice.text = "준비"
        // main레이블 초기화
        // 첨퓨터 랜덤 가위바위보 선택하고 저장
        
        lblMain.text = "선택하세요"
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
    }
}

