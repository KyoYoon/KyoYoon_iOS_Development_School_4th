//
//  ViewController.swift
//  VendingMachine
//
//  Created by 정교윤 on 2017. 5. 19..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 가격표 변수
    @IBOutlet weak var labelSprite: UILabel! // 스프라이트 가격 라벨
    @IBOutlet weak var labelCappuccino: UILabel! // 나는카푸치 가격 라벨
    @IBOutlet weak var labelGeorgia: UILabel! // 조지아 캔커피 가격 라벨
    @IBOutlet weak var labelFanta: UILabel! // 판타 가격 라벨
    @IBOutlet weak var labelCoke: UILabel! // 콜라 가격 라벨
    @IBOutlet weak var labelMaeil: UILabel! // 매일 카페라떼 가격 라벨
    
    // 사용자가 넣은 돈 액수
    @IBOutlet weak var labelUserInputMoney: UILabel!
    
    // 잔액 변수
    @IBOutlet weak var labelChange: UILabel!
    
    // 출력 라벨 변수 - 거스름돈 정보 출력
    @IBOutlet weak var labelChangeInfo: UILabel!
    
    // 사용자가 입력한 돈을 저장할 배열 선언
    var userInputMoneyArray:[Int] = []
    var userReceiveChangeArray:[Int] = []
    
    // 잔돈 표시 튜플 (10000원 몇 개, 5000원 몇 개, 1000원 몇 개, 500원 몇 개, 100원 몇 개)
    var changes:(Int, Int, Int, Int, Int)?
    
    // 반환버튼을 눌렀는지 안 눌렀는지 확인
    var isReturnButtonClicked:Bool?
    
    // 음료수를 클릭시 음료수 가격을 받아서
    // 사용자가 입력한 금액이 있는지 확인 후 금액이 없거나 어느 음료수 금액보다도 적다면
    // 금액을 더 넣으라는 메시지를 출력하고 금액이 맞거나 더 많으면 
    // 잔액 라벨에 액수를 보여준다. 
    
    func displayUserReceiveChange(price beveragePrice:Int) {
        
        
        var totalUserInputMoney:Int = 0
        
        var change:Int = 0
        
        var totalBeveragePrice:Int = 0 // 사용자가 자판기에서 뽑은 음료수 총액
        
        if userInputMoneyArray.count == 0 {
            
            // 사용자가 돈을 전혀 넣지 않았다. 
            // 돈을 넣으라는 메시지 출력 
            labelChangeInfo.text = "입력한 돈이 0원입니다. 돈을 넣으십시오!"
            
            
            
        }
        else {
            
            // 사용자가 넣은 돈 다 합산하기
            for userInputMoney in userInputMoneyArray {
                totalUserInputMoney += userInputMoney
            }
            
            // 음료수를 처음 뽑았을 때는 잔액 배열의 길이가 0
            if userReceiveChangeArray.count == 0 {
                totalBeveragePrice = beveragePrice
                
                print("사용자가 기존에 뽑은 음료수 totalBeveragePrice: \(totalBeveragePrice)")
                
                print("사용자가 지금 뽑은 음료수 beveragePrice: \(beveragePrice)")
                
                
                change = totalUserInputMoney - totalBeveragePrice
                
                print("사용자가 보유한 잔돈: \(change)")
                
                
                if (change > 0) { // 잔액이 0보다 클 때만 잔액 배열에 추가
                    labelChangeInfo.text = ""
                    userReceiveChangeArray.append(beveragePrice)
                    
                    print(userReceiveChangeArray)
                    labelChange.text = String(change)
                    
                    // 잔액 계산하면서 잔액이 각 제품가격과 비교하여 작으면 가격표 색깔을 하얀색으로 바꾼다.
                    restorePriceTagColor(money: change)
                    
                } else {
                    labelChangeInfo.text = "잔액이 부족합니다. 돈을 더 넣으세요."
                    
                    //userInputMoneyArray = []
                    labelChange.text = "0"
                    
                    // 가격표 색깔 초기화
                    initPriceTagColor()

                }

                
                
            } else { // 음료수를 한 번 이상 뽑았을 때부터는 잔액 배열의 길이가 0보다 큼
                
                // 기존에 뽑은 음료수 가격 더하기 
                for beveragePrice in userReceiveChangeArray {
                    totalBeveragePrice += beveragePrice
                }
                
                
                print("사용자가 기존에 뽑은 음료수 totalBeveragePrice: \(totalBeveragePrice)")
                
                print("사용자가 지금 뽑은 음료수 beveragePrice: \(beveragePrice)")
                
                // 사용자가 넣은 돈 총액 - 기존에 뽑은 음료수 가격들의 합 - 현재 뽑은 음료수 가격
                change = totalUserInputMoney - totalBeveragePrice - beveragePrice

                print("사용자가 보유한 잔돈: \(change)")
                
                
                if (change > 0) { // 잔액이 0보다 클 때만 잔액 배열에 추가
                    labelChangeInfo.text = ""
                    userReceiveChangeArray.append(beveragePrice)
                    
                    print(userReceiveChangeArray)
                    labelChange.text = String(change)
                    
                    // 잔액 계산하면서 잔액이 각 제품가격과 비교하여 작으면 가격표 색깔을 하얀색으로 바꾼다.
                    restorePriceTagColor(money: change)
                    
                    
                } else { // 잔액이 0이거나 잔액이 - 가 되면 잔돈을 사용자가 넣은 돈에 옮긴다.
                    labelChangeInfo.text = "잔액이 부족합니다. 돈을 더 넣으세요."
                    
                    labelChange.text = "0"
                    
                    // 가격표 색깔 초기화
                    initPriceTagColor()
                    
                    
                }
                
                
            }
            
            
            
            
        }
        
        
    }
    
    // 음료수 클릭 액션 함수
    @IBAction func clickBeverageButton(_ sender: UIButton) {
        
        let beverageButtonTag = sender.tag
        var beveragePrice:Int = 0
        
        switch beverageButtonTag {
        case 100: 
            print("Sprite")
            beveragePrice = Int(labelSprite.text!)!
            print(beveragePrice)
            displayUserReceiveChange(price: beveragePrice)
            
        case 200:
            print("Capuccino")
            // 잔액 관련 어레이에 추가
            beveragePrice = Int(labelCappuccino.text!)!
            print(beveragePrice)
            displayUserReceiveChange(price: beveragePrice)
            
        case 300:
            print("Georgia")
            // 잔액 관련 어레이에 추가
            beveragePrice = Int(labelGeorgia.text!)!
            print(beveragePrice)
            displayUserReceiveChange(price: beveragePrice)
        case 400:
            print("Fanta")
            // 잔액 관련 어레이에 추가
            beveragePrice = Int(labelFanta.text!)!
            print(beveragePrice)
            displayUserReceiveChange(price: beveragePrice)
        case 500:
            print("Coke")
            // 잔액 관련 어레이에 추가
            beveragePrice = Int(labelCoke.text!)!
            print(beveragePrice)
            displayUserReceiveChange(price: beveragePrice)
        case 600:
            print("Maeil")
            // 잔액 관련 어레이에 추가
            beveragePrice = Int(labelMaeil.text!)!
            print(beveragePrice)
            displayUserReceiveChange(price: beveragePrice)
        default:
            print("Wrong!")
        
        }
        
    }
    
    // 사용자가 입력한 돈을 사용자가 넣은 돈 배열에 엘리먼트로 하나씩 추가하고 
    // 총액을 보여준다
    
    func displayTotalUserInputMoney(money userInputMoney:Int) {
        
        var totalUserInputMoney:Int = 0
        
        // 사용자가 입력한 돈 배열에 돈을 추가한다.
        userInputMoneyArray.append(userInputMoney)
        
        for money in userInputMoneyArray {
            totalUserInputMoney += money
        }
        
        changePriceTagColor(money: totalUserInputMoney)
        
        labelUserInputMoney.text = String(totalUserInputMoney)
        
    }
    
    // 사용자가 넣은 돈 총액과 각 음료수 가격을 비교하여 사용자가 넣은 돈 총액이 각 음료수 가격보다 크거나
    // 같은 것만 가격 라벨 배경색을 파란색으로 바꾼다.
    func changePriceTagColor(money totalUserInputMoney:Int) {
        
        if totalUserInputMoney >= Int(labelSprite.text!)! {
            labelSprite.backgroundColor = UIColor.blue
        }
        if totalUserInputMoney >= Int(labelCappuccino.text!)! {
            labelCappuccino.backgroundColor = UIColor.blue
        }
        if totalUserInputMoney >= Int(labelGeorgia.text!)! {
            labelGeorgia.backgroundColor = UIColor.blue
        }
        if totalUserInputMoney >= Int(labelFanta.text!)! {
            labelFanta.backgroundColor = UIColor.blue
        }
        if totalUserInputMoney >= Int(labelCoke.text!)! {
            labelCoke.backgroundColor = UIColor.blue
        }
        if totalUserInputMoney >= Int(labelMaeil.text!)! {
            labelMaeil.backgroundColor = UIColor.blue
        }
        
        
    }
    
    // 사용자가 넣은 돈 총액과 각 음료수 가격을 비교하여 사용자가 넣은 돈 총액이 각 음료수 가격보다
    // 작은 것만 가격 라벨 배경색을 햐안색으로 복원한다.
    func restorePriceTagColor(money totalUserInputMoney:Int) {

        if totalUserInputMoney < Int(labelSprite.text!)! {
            labelSprite.backgroundColor = UIColor.white
        }
        if totalUserInputMoney < Int(labelCappuccino.text!)! {
            labelCappuccino.backgroundColor = UIColor.white
        }
        if totalUserInputMoney < Int(labelGeorgia.text!)! {
            labelGeorgia.backgroundColor = UIColor.white
        }
        if totalUserInputMoney < Int(labelFanta.text!)! {
            labelFanta.backgroundColor = UIColor.white
        }
        if totalUserInputMoney < Int(labelCoke.text!)! {
            labelCoke.backgroundColor = UIColor.white
        }
        if totalUserInputMoney < Int(labelMaeil.text!)! {
            labelMaeil.backgroundColor = UIColor.white
        }
        
        
    }
    
    
    // 돈 버튼 클릭 함수 100원/500원/1000원/5000원/10000원 
    @IBAction func touchUpMoneyButton(_ sender: UIButton) {
        
        
        
        let moneyButtonTag = sender.tag

        if isReturnButtonClicked == true {
            labelChangeInfo.text = ""
            isReturnButtonClicked = false 
        }
        
        switch moneyButtonTag {
        case 700:
            print("100원")
            displayTotalUserInputMoney(money: 100)
            
        case 800:
            print("500원")
            displayTotalUserInputMoney(money: 500)
            
        case 900:
            print("1000원")
            displayTotalUserInputMoney(money: 1000)
        case 1000:
            print("5000원")
            displayTotalUserInputMoney(money: 5000)
        case 1100:
            print("10000원")
            displayTotalUserInputMoney(money: 10000)
        default:
            print("Wrong!")
            
        }
        
        
        //changePriceTagColor(moneyButtonTag)
        
        
        
    }
    
    // 잔돈 프린트
    func countChanges(forMoney money:Int)-> (count100000w:Int, count5000w:Int, count1000w:Int, count500w:Int, count100w:Int)
    {
        
        
        
        
        var remainMoney = money
        var count10000won = 0
        var count5000won = 0
        var count1000won = 0
        var count500won = 0
        var count100won = 0
        
        if (remainMoney >= 10000)
        {
            count10000won = remainMoney/10000
            remainMoney = remainMoney%10000
            
        }
        if (remainMoney >= 5000)
        {
            count5000won = remainMoney/5000
            remainMoney = remainMoney%5000
        }
        if (remainMoney >= 1000)
        {
            count1000won = remainMoney/1000
            remainMoney = remainMoney%1000
        }
        if (remainMoney >= 500)
        {
            count500won = remainMoney / 500
            remainMoney = remainMoney % 500
        }
        if (remainMoney >= 100)
        {
            count100won = remainMoney / 100
            remainMoney = remainMoney % 100
        }
        
        
        
        return (count10000won, count5000won, count1000won, count500won, count100won)
        
        
    }
    
    //잔돈 프린트
    func printNumOfChanges(money myMoney:Int)
    {
        var changes:(Int, Int, Int, Int, Int)
        
        print("받은 금액: \(myMoney)")
        
        changes = countChanges(forMoney: myMoney)
        
        
        print("10000원 \(changes.0)개")
        print("5000원 \(changes.1)개")
        print("1000원 \(changes.2)개")
        print("500원 \(changes.3)개")
        print("100원 \(changes.4)개")
        
        labelChangeInfo.text = "고객님이 받을 돈은 10000원 \(changes.0)개, 5000원 \(changes.1)개, 1000원 \(changes.2)개, 500원 \(changes.3)개, 100원 \(changes.4)개 입니다."
    }
    
    //printNumOfChanges(money: 55600)

    
    // 사용자가 받을 거스름돈 출력 함수
    func displayTotalChange (change totalChange:Int) {
        
        printNumOfChanges(money: totalChange)
        
        
        
    }

    // 가격표 강조표시 없애기
    func initPriceTagColor() {
        labelSprite.backgroundColor = UIColor.white
        labelCappuccino.backgroundColor = UIColor.white
        labelGeorgia.backgroundColor = UIColor.white
        labelFanta.backgroundColor = UIColor.white
        labelCoke.backgroundColor = UIColor.white
        labelMaeil.backgroundColor = UIColor.white

    }
    
    // 반환 버튼 클릭 함수
    @IBAction func touchUpReturnButton(_ sender: UIButton) {
        
        
        var totalChange:Int = 0 // 사용자가 받을 잔돈
        
        // 가격표 초기화
        initPriceTagColor()
        
        
        totalChange = Int(labelChange.text!)!
        
        // 거스름돈 정보 출력 
        print("사용자가 총 받을 잔돈: \(totalChange)")
        
        if totalChange != 0 {
            displayTotalChange(change: totalChange)
        }
        else {
            labelChangeInfo.text = "고객님이 받을 잔액은 0원입니다."
        }
        
        // 사용자가 넣은 돈 배열 초기화
        userInputMoneyArray = []
        
        // 사용자가 받을 잔돈 배열 초기화
        userReceiveChangeArray = []
        
        // 사용자가 넣은 돈 표시 0원
        labelUserInputMoney.text = "0"
        
        // 사용자가 받을 잔액 표시 0원
        labelChange.text = "0"
        
        //labelChangeInfo.text = ""
        
        isReturnButtonClicked = true
        
    }
    
    // 입력값 및 설정 초기화 
    func initConfig() {
        
        labelSprite.backgroundColor = UIColor.white
        labelCappuccino.backgroundColor = UIColor.white
        labelGeorgia.backgroundColor = UIColor.white
        labelFanta.backgroundColor = UIColor.white
        labelCoke.backgroundColor = UIColor.white
        labelMaeil.backgroundColor = UIColor.white
        
        labelUserInputMoney.text = "0"
        labelChange.text = "0"
        
        labelChangeInfo.text = ""
        
        changes = (0,0,0,0,0)
        
        isReturnButtonClicked = false
    
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 초기화
        initConfig()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

