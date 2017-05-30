//
//  ViewController.swift
//  BaseBall
//
//  Created by 정교윤 on 2017. 5. 23..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var labelStatusMessage: UILabel!
    
    @IBOutlet weak var ImageViewGlove1: UIImageView!
    
    @IBOutlet weak var ImageViewGlove2: UIImageView!
    
    @IBOutlet weak var ImageViewGlove3: UIImageView!
    
    
    var startMsg:String = "게임이 시작되었습니다. 아래의 숫자 버튼을 세 번 누른 후 Go 버튼을 클릭하세요!"
    var resultMsg:String = ""
    
    var gloveImage:UIImage?
    var catchImage:UIImage?
    
    // 게임 시도 횟수
    var inputNumFrequency:Int = 0
    
    // 숫자 세 개가 들어갈 배열
    var answerArray:[Int] = []
    
    // 내가 입력한 숫자가 들어갈 배열 
    var inputNumberArray:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        startGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initConfig() {
        answerArray = []
        inputNumberArray = []
        
        
        
    }
    
    // 게임이 시작될 때
    func startGame() {
        
        
        var count:Int = 0
        
        
        while count < 3 {
            let num:Int = Int(arc4random_uniform(9))+1
            
            if num != 0 {
                if answerArray.count != 0 {
                    if answerArray.contains(num) == false {
                        answerArray.append(num)
                        count += 1
                    }
                    
                }
                else {
                    answerArray.append(num)
                    count += 1
                }
            }
        }
        
//        while answerArray.count < 3 {
//            let num: Int = Int(arc4random() % 9) + 1
//            if !self.answerArray.contains(num) {
//                self.answerArray.append(num)
//            }
//        }
        
        labelStatusMessage.text = startMsg
        
        print(answerArray)
        
        
    }
    
    // 팝업창 띄워주기
    func displayPopupWindow(popupTitle:String, popupMessage:String) {
        
        let alertController = UIAlertController(title: popupTitle, message: popupMessage, preferredStyle: .alert)
        
        // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            
            NSLog("OK Pressed")
        }

        
        // Add the actions
        alertController.addAction(okAction)
        
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
        
    }

    // 야구 결과 보여주기 (스트라이크: 몇 회, 볼: 몇 회, 아웃: 몇 회)
    func displayPopupWindow(popupTitle:String, result:(Int,Int,Int)) {
        
        let alertController = UIAlertController(title: popupTitle, message: "게임결과 - 스트라이크 \(result.0)개, 볼 \(result.1)개, 아웃 \(result.2)개 \n 시도 회수", preferredStyle: .alert)
        
        // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            
            self.initConfig()
            self.restoreGloveImage()
            self.startGame()
            
            NSLog("OK Pressed")
        }
        
        
        // Add the actions
        alertController.addAction(okAction)
        
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    // 야구 결과 보여주기 (스트라이크: 몇 회, 볼: 몇 회, 아웃: 몇 회)
    func displayStatusMessage(inputNumFrequency:Int, result: (Int,Int,Int)) {
        
    }
    
    
    // 같은 숫자를 한 번 더 입력했는지 체크 
    // false 이면 입력을 허용하게 한다
    func checkDuplicateInputNumber (inputNum:Int) -> Bool {
        
        var returnValue:Bool = false
        
        if inputNumberArray.count == 0 {
            returnValue = false
        } else {
            if inputNumberArray.contains(inputNum) == true {
            
                returnValue = true
                
            } else {
                returnValue = false
            }
            
        }
        
        return returnValue
    }
    
    func changeGloveImage(endIndex:Int) {
        
        
        
        if endIndex == 0 {
            ImageViewGlove1.image = UIImage(named: "Catch")
            print("endindex 0")
        }
        if endIndex == 1 {
            ImageViewGlove2.image = UIImage(named: "Catch")
            print("endindex 1")
        }
        if endIndex == 2 {
            ImageViewGlove3.image = UIImage(named: "Catch")
            print("endindex 2")
        }
        
        
        
    }
    
    func restoreGloveImage() {
        
        
        
       
        ImageViewGlove1.image = UIImage(named: "Glove")
        ImageViewGlove2.image = UIImage(named: "Glove")
        ImageViewGlove3.image = UIImage(named: "Glove")
        
        
        
        
    }
    
    // 중복이면 메시지 띄우고 아니면 배열에 사용자가 입력한 숫자를 추가한다. 
    func addNumberToInputArray(num:Int) {
        if inputNumberArray.contains(num) == true {
            displayPopupWindow(popupTitle: "중복알림", popupMessage: "같은 숫자를 두 번 입력하셨습니다. 다른 숫자버튼을 클릭하세요!")
        } else {
            
            //inputNumFrequency += 1
            
            
            if inputNumberArray.count <= 2 {
                inputNumberArray.append(num)
                
                changeGloveImage(endIndex: inputNumberArray.count-1)
                
                
            } else {
                displayPopupWindow(popupTitle: "입력횟수초과", popupMessage: "숫자를 이미 세 번 입력하셨습니다. 이제 Go 버튼을 눌러주세요!")
            }
            
        }
    }
    
    func checkBaseBall(userInputNumArray:[Int]) -> (Int, Int, Int) {
        
        var strikeCount = 0
        var ballCount = 0
        var outCount = 0
        
        // 스트라이크 카운트, 볼 카운트, 아웃 카운트 반환
        for index in 0...2 {
            
            let compareNum = userInputNumArray[index]
            
            // 사용자가 입력한 숫자가 랜덤으로 산출한 수에 포함되어 있다면 
            if answerArray.contains(compareNum) == true {
                if answerArray[index] == compareNum {
                    strikeCount += 1
                } else { // 숫자는 있으나 자리가  안 맞는 경우
                    ballCount += 1
                }
            } else { // 전혀 포함된 게 없다면
                outCount += 1
            }
            
        }
        
        
        
        
        return (strikeCount, ballCount, outCount)
        
    }
    
    
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        
        print(sender.tag)
        addNumberToInputArray(num: sender.tag)
        
    }
    
    @IBAction func touchUpGoButton(_ sender: UIButton) {
        
        var result:(Int, Int, Int)
        
        if inputNumberArray.count == 3 {
            result = checkBaseBall(userInputNumArray: inputNumberArray)
            displayPopupWindow(popupTitle: "게임결과", result: result)
        } else {
            displayPopupWindow(popupTitle: "입력횟수미만", popupMessage: "입력한 숫자가 세 개보다 작습니다. 숫자를 더 선택하여 주세요!")
        }
        
    }
    
    


}

