//
//  ViewController.swift
//  GetTotalOneToN
//
//  Created by 정교윤 on 2017. 6. 12..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var textFieldNumber: UITextField!
    
    @IBOutlet weak var labelResultOne: UILabel!
    
    @IBOutlet weak var textFieldCharacter: UITextField!
    
    
    @IBOutlet weak var labelResultTwo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchUpRepeatBtn(_ sender: UIButton) {
        
        var sum:Int = 0
        
        if let num = Int(self.textFieldNumber.text!) {
            
            for index in 1...num {
                sum += index
            }
            
        }
        
        self.labelResultOne.text = "1부터 \(self.textFieldNumber.text!)까지의 합은 \(sum)입니다."
    }
    
    @IBAction func touchUpEquation(_ sender: UIButton) {
        
        var sum:Int = 0
        
        if let num = Int(self.textFieldNumber.text!) {
            
            sum = (num*(num+1))/2
            
        }
        
        self.labelResultOne.text = "1부터 \(self.textFieldNumber.text!)까지의 합은 \(sum)입니다."
        
    }
    
    @IBAction func touchUpRecursiveBtn(_ sender: UIButton) {
        
        var sum:Int = 0
        
        if let num = Int(self.textFieldNumber.text!) {
            
            sum = recursiveSum(num)
            
        }
        
        self.labelResultOne.text = "1부터 \(self.textFieldNumber.text!)까지의 합은 \(sum)입니다."
       
        
    }
    
    func recursiveSum(_ num:Int) -> Int {
        
        if num == 1 {
            return 1
        }
        
        let result:Int = num + recursiveSum(num - 1)
        
        return result
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        switch textField.tag {
//        case 100:
//            self.view.viewWithTag(200)?.becomeFirstResponder()
//        default:
//            textField.resignFirstResponder()
//            // 바로 로그온 처리를 한다.
//            //self.loginRequest()
//        }
        
        if textField.tag == 100 {
            
            self.extractMiddleCharacters(char: textField.text!)
            
        }
        
        return true
    }
    
    // 가운데 문자 출력하기: apple => "p" / iPad = "Pa"
    func extractMiddleCharacters(char:String) {
        
        var resultStr:String?
        
        resultStr = char
        
        //textArray = Array(char)
        
        if char.characters.count % 2 == 0 { // 짝수 => 최종 남은 숫자가 2개
            print("짝수")
            
            let frequency:Int = (char.characters.count - 2) / 2
            
            if frequency == 0 {
                resultStr = ""
            } else {
                
                for _ in 1...frequency {
                    resultStr = String(resultStr!.characters.dropFirst()) // "1234" => "234"
                    
                }
                
                for _ in 1...frequency {
                    resultStr = String(resultStr!.characters.dropLast()) // "234" => "23"
                    
                }
                
            }
            
        } else { // 홀수 => 최종 남은 숫자가 1개
            print("홀수")
            
            let frequency:Int = (char.characters.count - 1) / 2
            
            print(frequency)
            
            if frequency == 0 {
                resultStr = ""
            } else {
                for _ in 1...frequency {
                    resultStr = String(resultStr!.characters.dropFirst()) // "123" => "23"
                    
                }
                
                for _ in 1...frequency {
                    resultStr = String(resultStr!.characters.dropLast()) // "23" => "2"
                    
                }
                
            }

            
        }
        
        self.labelResultTwo.text = resultStr
        
    }


}

