//
//  ViewController.swift
//  HarshadNumber
//
//  Created by 정교윤 on 2017. 6. 13..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var textFieldNum: UITextField!
    
    @IBOutlet weak var labelResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //UITableView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            
            if textField.text == nil || textField.text == "" {
                labelResult.text = "숫자를 입력하여 주세요."
            } else {
                
                
                self.displayHarshardNumber(textField.text!)
            }
            
            
        }
        
        return true
    }

    // 숫자의 자리수가 2개 이상일 때 각 자리수의 합으로 그 숫자를 나누었을 때 나머지가 0이면 
    // true를 반환하고 아니면 false를 반환한다.
    func displayHarshardNumber (_ num:String) {
        
        if num.characters.count < 2 {
            labelResult.text = "자리수가 2자리 이상인 숫자를 입력하여 주세요!"
        } else {
            var eachNum:Int = 0
            
            let intArray = num.characters.flatMap{Int(String($0))}
            
            print(intArray)
            
            
            
            if intArray == [] {
                labelResult.text = "숫자가 아닌 문자를 입력하셨습니다."
            } else if num.characters.count != intArray.count {
                labelResult.text = "숫자와 문자가 섞여있습니다."
            } else {
                
                let inputNum = convertIntArrayToInteger(intArray)
                
                for index in intArray {
                    print(index)
                    
                    eachNum += index
                }
                
                print(inputNum)
                print(eachNum)
                
                if inputNum % eachNum == 0 {
                    labelResult.text = "결과: True"
                } else {
                    labelResult.text = "결과: False"
                }

            }
            
            
        }
        
        
    }
    
    func convertIntArrayToInteger (_ numArray:[Int]) -> Int {
        
        let myArray = numArray
        var myString = ""
        _ = myArray.map{ myString = myString + "\($0)" }
        let myInt = Int(myString)
        
        return myInt!
        
    }
    
    func displayHarshadNumber2 (_ num:String) {
        
        var b:[Character] = Array(num.characters)
        
        let c = String(b)
        
        print(c)
        
    }
    
    
}

