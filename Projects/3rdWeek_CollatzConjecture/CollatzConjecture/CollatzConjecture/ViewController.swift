//
//  ViewController.swift
//  CollatzConjecture
//
//  Created by 정교윤 on 2017. 5. 24..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldNumber: UITextField!
    
    @IBOutlet weak var labelResultValue: UILabel!
    
    var calculationArr:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchUpCalculate(_ sender: UIButton) {
        
        let inputNumber:Int? = Int(textFieldNumber.text!)
        
        if let number = inputNumber {
            //printCollatzConjectureFrequencyMsg(inputNum: number)
            
            self.labelResultValue.text = "결과는 \(collatzRecursive(num: number))"

        }
        
//        if Int(textFieldNumber.text!)! != 1 {
//                    } else {
//            labelResultValue.text = "1은 허용이 되지 않습니다!"
//        }
        
        
        
        
    }
    
    // recursive function
    func printCollatzConjectureFrequencyMsg(inputNum:Int) {
        
        
        var calNum:Int
        
        if inputNum != 1 {
            
            if inputNum % 2 == 0 {
                calNum = inputNum / 2
                calculationArr.append(calNum)
            }
            else {
                calNum = (inputNum * 3) + 1
                calculationArr.append(calNum)
            }
            
            if calNum != 1 {
                printCollatzConjectureFrequencyMsg(inputNum: calNum)
            }

        }
        
        

        
    }
    
    // while function 
    func printCollatzConjectureFrequencyMsgWhile(inputNum:Int) {
        
        var calNum:Int = 0
        
        if inputNum != 1 {
            
            while calNum != 1 {
                if inputNum % 2 == 0 {
                    calNum = inputNum / 2
                    calculationArr.append(calNum)
                }
                else {
                    calNum = inputNum * 3 + 1
                    calculationArr.append(calNum)
                }
                
            }

        }
        
        
    }
    
    // factorial
    func factorial(num:Int) -> Int {
        var fac:Int = 1
        
        for i in 1...num {
            fac = fac * i
        }
        
        return fac
    }
    
    // factorial (recursive)
    func factorialRecursive(num:Int) -> Int {
        if num <= 1 {
            return 1
        } else {
            return num * factorialRecursive(num: num-1)
        }
    }
    
    func collatzRecursive(num:Int) -> Int {
        if num == 1 {
            return 0
        } else {
            if num % 2 == 0 {
                return 1 + collatzRecursive(num: num/2)
            } else {
                return 1 + collatzRecursive(num: num*3 + 1)
            }
            
        }
        
    }

}

