//
//  ViewController.swift
//  FibonacciNumbers
//
//  Created by 정교윤 on 2017. 5. 24..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textFieldNum: UITextField!
    
    @IBOutlet weak var labelResultMsg: UILabel!
    
    var numArr:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchUpCalculate(_ sender: UIButton) {
        // optional binding 
        let inputNumber:Int? = Int(textFieldNum.text!)
        
        var msgStr:String = ""
        
        if let number = inputNumber {
            if number < 2 {
                labelResultMsg.text = "1보다 큰 수를 입력하세요."
            } else {
                numArr = FibonacciNumbers(with: number)
                
                for index in numArr {
                    msgStr += String(index) + ", "
                }
                
                labelResultMsg.text = "\(number)개의 수를 가진 피보나치 수열: \n \(msgStr)"
            }
        }
        
    }
    
    
    // 재귀함수
    func FibonacciNumbers(with parameter:Int) -> [Int]{
        
        let lastIndex = parameter - 1
        
        if lastIndex == 1 {
            return [1,1]
        } else {
            var resultArray = FibonacciNumbers(with: lastIndex)
            
            let result: Int = resultArray[lastIndex - 1] + resultArray[lastIndex - 2]
            resultArray.append(result)
            
            return resultArray
        }
        
        
    }

}

