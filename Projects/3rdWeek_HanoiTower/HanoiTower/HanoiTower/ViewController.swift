//
//  ViewController.swift
//  HanoiTower
//
//  Created by 정교윤 on 2017. 5. 24..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    var resultArray:[String] = [] // 출력 메시지 배열
    
    var strMsg:String = "" // 출력 메시지
    
    var strTotalMsg:String = ""
    
    var tryFrequency:Int = 0 // 시도 횟수
    
    @IBOutlet weak var textFieldHeight: UITextField!

    
    //@IBOutlet weak var labelResult: UILabel!
    
    @IBOutlet weak var textViewResult: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initTextView()
        //moveTower(height: 2, fromPole: "A", toPole: "B", withPole: "C")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initTextView() {
        textViewResult.text = ""
        textViewResult.layer.borderColor = UIColor.lightGray.cgColor
        textViewResult.layer.borderWidth = 0.5
        textViewResult.layer.cornerRadius = 6
        
    }
    
    @IBAction func touchUpCalculate(_ sender: UIButton) {
        
        resultArray = []
        //labelResult.text = ""
        tryFrequency = 0
        
        strMsg = ""
        strTotalMsg = ""
        textViewResult.text = ""
        
        // optional binding
        let height:Int? = Int(textFieldHeight.text!)
        
        if let param = height {
            moveTower(height: param, fromPole: "A", toPole: "C", withPole: "B")
        }
        
        for result in resultArray {
            strTotalMsg += result
        }
        
        textViewResult.text = strTotalMsg
        
    }
    
    
    func moveDisk(height:Int, fromPole:String, toPole:String) {
        
        tryFrequency += 1
        
        strMsg = "\(tryFrequency)번째 시도: 기둥 \(fromPole)로부터 \(height)번째 원반을 기둥 \(toPole)으로 옮겼습니다. \n"
        
        print(strMsg)
        resultArray.append(strMsg)
    }
    
    // 원판이 1개면 출발지에서 목적지 
    // 원판이 2개 이상인 경우. 
    // n-1개의 원판을 춟발지에서 목적지를 거쳐 경유지로 (fromPole: A / toPole: C / withPole: B)
    // n번을 출발지에서 목적지로 (fromPole: A / toPole: B)
    // n-1개를 경유지에서 출발지를 거쳐 목적지로 (fromPole: C / toPole: B / withPole: A)
    
    func moveTower(height:Int, fromPole:String, toPole:String, withPole:String) {
        
        if height == 1 {
            // 원반 한 개일 때는 기둥 A에서 B로 한 번만 옮기면 된다.
            moveDisk(height: height, fromPole: fromPole, toPole: toPole)
        } else {
            
            // 이해하기 어려운 로직!! 설명이 필요하다..
            moveTower(height: height-1, fromPole: fromPole, toPole: withPole, withPole: toPole) // 기둥 A에서 원반을 기둥 B를 거쳐서 기둥 C으로 옮긴다.
            moveDisk(height: height, fromPole: fromPole, toPole: toPole) // 기둥 A에서 B으로 옮긴다 출력
            moveTower(height: height-1, fromPole: withPole, toPole: toPole, withPole: fromPole) // 기둥 C에서 기둥 A을 거쳐서 원반을 기둥 B로 옮긴다.
        }
        
    }
    
    
    
    func hanoi(numberOfRing:Int, from:String, by:String, to:String) {
        if numberOfRing == 1 {
            print("\(numberOfRing)번 원판을 \(from)에서 \(to)로 이동")
        } else {
            hanoi(numberOfRing: numberOfRing-1, from: from, by: to, to: by)
            print("\(numberOfRing)번 원판을 \(from)에서 \(to)로 이동")
            hanoi(numberOfRing: numberOfRing-1, from: by, by: from, to: to)
            
        }
    }
    
    // 모든 원반을 A에서 C로 옮긴다는 전제하에 시작
    // 1개일 때 1개를 A에서 C로 옮긴다
    // 1개 이상인 경우
    // n-1개의 원판을 A에서 C를 거쳐 B로 옮긴다.
    // n 개의 원반을 A에서 C로 옮긴다.
    // n-1개의 원반을 B에서 A를 거쳐 C로 옮긴다. 
    
    func hanoi2(numOfRing:Int, from:String, by:String, to:String) {
        if numOfRing == 1 {
            print("\(numOfRing)번 원반을 \(from)에서 \(to)로 이동")
        } else {
            hanoi2(numOfRing: numOfRing-1, from: from, by: to, to: by)
            print("\(numOfRing)번 원반을 \(from)에서 \(to)로 이동")
            hanoi2(numOfRing: numOfRing-1, from: by, by: from, to: to)
        }
        
    }
    
    


}

