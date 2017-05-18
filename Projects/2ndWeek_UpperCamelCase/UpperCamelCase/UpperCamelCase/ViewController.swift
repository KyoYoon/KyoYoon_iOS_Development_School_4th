//
//  ViewController.swift
//  UpperCamelCase
//
//  Created by 정교윤 on 2017. 5. 17..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var inputTextField: UITextField!
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func runButtonTouched(_ sender: UIButton) {
        
        let numb:UInt = UInt(self.inputTextField.text!)!
        //let numb:Int = Int(self.inputTextField.text!)!
        
        
        
        //self.isEvenNumber(number: numb)
        self.getSumOfDivisorsExceptOneAndInputNumber(number: numb)
    }
    
    func isEvenNumber(number num: Int) {
        if num % 2 == 0 {
            self.resultLabel.text = "짝수입니다."
        } else {
            self.resultLabel.text = "홀수입니다."
        }
    }
    
    func getSumOfDivisorsExceptOneAndInputNumber(number num: UInt) {
        
        var sum:UInt = 0
        
        if num <= 2 {
            self.resultLabel.text = "2보다 큰 정수를 입력하셔야 합니다."
        } else {
            // 2보다 큰 정수이면서 1과 자기 자신은 제외
            for index in 2..<num {
                
                if num % index == 0 { // 약수라면
                    sum += index // 약수들의 합 계산
                }
                
            }
            
            self.resultLabel.text = "1과 \(num)을 제외한 \n \(num)의 약수들의 합은 \(sum)"
            
        }
        
        
        
        
        
    }


}

