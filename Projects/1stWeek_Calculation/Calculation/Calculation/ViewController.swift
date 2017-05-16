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
    
    @IBOutlet weak var displayLB: UILabel!
    
    var tempFirstNum:Int = 0
    var tempSecondNum:Int = 0
    var tempOperation:String = ""
    
    var displayNumber:String = "0"
    
    ///////////////////// View Life Cycle ////////////////////
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(initTxt)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    ///////////////////// View Action ////////////////////
    // MARK: - View Action
    @IBAction func clickBtnAC(_ sender: UIButton) {
        print("AC 버튼이 클릭되었습니다.")
        self.displayLB.text?.removeAll()
        self.displayLB.text = "0"
        
        tempFirstNum = 0
        tempSecondNum = 0
        tempOperation = ""
        displayNumber = "0"

    }
    
    
    @IBAction func clickBtnPlusMinus(_ sender: UIButton) {
        print("± 버튼이 클릭되었습니다.")
    }
    

    @IBAction func clickBtnPercent(_ sender: UIButton) {
        print("% 버튼이 클릭되었습니다.")
    }
    
    
    // MARK: - 연산자 버튼 관련 함수 +, -, /, *
    
    @IBAction func operationButtonTouched(_ sender: UIButton) {
        
        print("\(sender.currentTitle!) 버튼을 눌렀습니다.")
        
        var operation:String = ""
        
        operation = sender.currentTitle!
        
        switch operation {
        case "÷":
            updateTempOperation("/")
        case "×":
            updateTempOperation("*")
        default:
            updateTempOperation(operation)
        }
        
        
    }
    

    
    @IBAction func clickBtnEqual(_ sender: UIButton) {
        print("= 버튼이 클릭되었습니다")
        var resultValue:Int = 0
        switch tempOperation {
        case "+":
            resultValue = plus(firstNum: tempFirstNum, secondNum: tempSecondNum)
        case "-":
            resultValue = minus(firstNum: tempFirstNum, secondNum: tempSecondNum)
        case "*":
            resultValue = multiply(firstNum: tempFirstNum, secondNum: tempSecondNum)
        case "/":
            resultValue = divide(firstNum: tempFirstNum, secondNum: tempSecondNum)
        default:
            resultValue = 0
        }
        
        self.displayLB.text = "\(resultValue)"
        
        tempFirstNum = 0
        tempSecondNum = 0
        tempOperation = ""
        displayNumber = "0"
        
    }
    
    @IBAction func clickBtnPoint(_ sender: UIButton) {
        print(". 버튼이 클릭되었습니다")
        //self.displayLB.text = "."
    }
    
    // MARK: - 숫자 버튼 클릭시 처리함수
    // 기존 코드와 다르게 하나의 함수에 숫자 버튼을 전부 연결해서 생성한다.
    @IBAction func numberButtonTouched(_ sender: UIButton) {
        print("\(sender.currentTitle!)번 버튼이 클릭되었습니다")
        
        //addFirstOrSecondNumber((sender.titleLabel?.text!)!)
        addDisplayNumber(sender.currentTitle!)
        addFirstOrSecondNumber()
        
        self.displayLB.text = displayNumber

    }
    
    // MARK: - 연산자 기호 업데이트하는 함수
    func updateTempOperation(_ operation:String) {
        tempOperation = operation
        displayNumber = "0"
        
    }

    // MARK: - 내부 디스플레이 번호 저장
    func addDisplayNumber(_ numberString:String) {
        switch displayNumber {
        case "0":
            displayNumber = numberString
        default:
            displayNumber += numberString
        }
    }
    
    // MARK: - 첫 번째 두 번째 숫자일 때 판단
    func addFirstOrSecondNumber() {
        if tempOperation.isEmpty {
            // 아직 첫번째 숫자
            tempFirstNum = Int(displayNumber)! // nil 이 아니고 숫자로
            // 변환가능하다라는 의미
            
        } else {
            // 두번째 숫자
            tempSecondNum = Int(displayNumber)!
        }
    }
    
    // 더하기 함수
    func plus(firstNum:Int, secondNum:Int) -> Int {
        return firstNum + secondNum
    }
    
    // 빼기 함수
    func minus(firstNum:Int, secondNum:Int) -> Int {
        return firstNum - secondNum
    }
    
    // 곱하기 함수
    func multiply(firstNum:Int, secondNum:Int) -> Int {
        return firstNum * secondNum
    }
    
    // 나누기 함수 
    func divide(firstNum:Int, secondNum:Int) -> Int {
        return firstNum / secondNum
    }
    

}

