//
//  ViewController.swift
//  Calculation
//
//  Created by 정교윤 on 2017. 5. 10..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var initTxt:String = "프로그램이 시작됩니다."
    
    @IBOutlet var displayLB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(initTxt)
        
        
    }
    
    
    @IBAction func clickBtnAC(_ sender: UIButton) {
        print("AC 버튼이 클릭되었습니다.")
    }
    
    
    @IBAction func clickBtnPlusMinus(_ sender: UIButton) {
        print("± 버튼이 클릭되었습니다.")
    }
    

    @IBAction func clickBtnPercent(_ sender: UIButton) {
        print("% 버튼이 클릭되었습니다.")
    }
    
    
    @IBAction func clickBtnDivide(_ sender: UIButton) {
        print("÷ 버튼이 클릭되었습니다.")
    }
    
    @IBAction func clickBtnMultiply(_ sender: UIButton) {
        print("× 버튼이 클릭되었습니다")
    }
    
    @IBAction func clickBtnSubtract(_ sender: UIButton) {
        print("- 버튼이 클릭되었습니다")
    }
    
    @IBAction func clickBtnAdd(_ sender: UIButton) {
        print("+ 버튼이 클릭되었습니다")
    }
    
    @IBAction func clickBtnEqual(_ sender: UIButton) {
        print("= 버튼이 클릭되었습니다")
    }
    
    @IBAction func clickBtnPoint(_ sender: UIButton) {
        print(". 버튼이 클릭되었습니다")
    }
    
    @IBAction func clickBtnZero(_ sender: UIButton) {
        print("0 버튼이 클릭되었습니다")
    }
    
    @IBAction func clickBtnOne(_ sender: UIButton) {
        print("1 버튼이 클릭되었습니다")
    }
    
    @IBAction func clickBtnTwo(_ sender: UIButton) {
        print("2 버튼이 클릭되었습니다")
    }
    
    @IBAction func clickBtnThree(_ sender: UIButton) {
        print("3 버튼이 클릭되었습니다")
    }
    
    @IBAction func clickBtnFour(_ sender: UIButton) {
        print("4 버튼이 클릭되었습니다")
    }
    
    @IBAction func clickBtnFive(_ sender: UIButton) {
        print("5 버튼이 클릭되었습니다")
    }
    
    @IBAction func clickBtnSix(_ sender: UIButton) {
        print("6 버튼이 클릭되었습니다")
    }
    
    @IBAction func clickBtnSeven(_ sender: UIButton) {
        print("7 버튼이 클릭되었습니다")
    }
    
    @IBAction func clickBtnEight(_ sender: UIButton) {
        print("8 버튼이 클릭되었습니다")
    }
    
    @IBAction func clickBtnNine(_ sender: UIButton) {
        print("9 버튼이 클릭되었습니다")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

