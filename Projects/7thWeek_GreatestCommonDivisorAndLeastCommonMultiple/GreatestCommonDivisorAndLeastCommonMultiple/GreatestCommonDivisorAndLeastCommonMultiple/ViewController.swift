//
//  ViewController.swift
//  GreatestCommonDivisorAndLeastCommonMultiple
//
//  Created by 정교윤 on 2017. 6. 28..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var paramOneTextField: UITextField!
    
    @IBOutlet weak var paramTwoTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var resultTwoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getGCDandLCM(_ sender: UIButton) {
        
        let param1 = Int(paramOneTextField.text!)
        
        let param2 = Int(paramTwoTextField.text!)
        
        let result = getGCD(param1: param1!, param2: param2!)
    
    }
    
    // 최대 공약수 6, 9 >> 3
    func getGCD(param1:Int, param2:Int) -> Int {
        
        // param1 6 param2 9
        
        
        
        return 0
    }
    
    // 최소 공배수 6, 9 >> 18
    func getLCM(param1:Int, param2:Int) -> Int {
        
        
        return 0
    }
    
    // 최소공배수 
    func multi(num3: Int, num4:Int) -> Int
    {
        let tempNum = multi2(num1: num3, num2: num4)
        return num3 * num4 / tempNum
    }
    
    // 최대공약수
    func multi2(num1: Int, num2:Int) -> Int
    {
        var tempNum1 = num1
        var tempNum2 = num2
        
        if num1 > num2
        {
            while num1 % tempNum2 != 0 || num2 % tempNum2 != 0
            {
                tempNum2 -= 1
            }
            return tempNum2
        }else
        {
            while num1 % tempNum1 != 0 || num2 % tempNum1 != 0
            {
                tempNum1 -= 1
            }
            return tempNum1
        }
    }

}

