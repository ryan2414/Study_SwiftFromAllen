//
//  ViewController.swift
//  MyFirstApp
//
//  Created by 이승재 on 2023/05/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblMain: UILabel!
    @IBOutlet var btnMy: UIButton!
    
    //앱의 화면에 들어오면 처음 실행시키는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        lblMain.text = "안녕하세요."
//        lblMain.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
//        lblMain.textColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        btnMy.backgroundColor = UIColor.green
    }
    
    
}

