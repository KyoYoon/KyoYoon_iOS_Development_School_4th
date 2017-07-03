//
//  ViewController.swift
//  TimerTest
//
//  Created by 정교윤 on 2017. 6. 26..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var timerLabel: UILabel!
    var timer: Timer?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var secondsValue:Int = 0
    var index: Int = 0
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //self.startTimer(for: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 분을 초단위로 세서 찍어주는 함수
    func startTimer(for minute: Int) {
        
        let seconds: Int = minute * 60
        var index: Int = 0
        
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer: Timer) in
            
            print(index)
            
            self.timerLabel.text = String(index)
            index += 1
            
            if index > seconds {
                timer.invalidate()
            }
            
            
        })
        
        self.timer?.fire() // 타이머 실행
    }
    
    @IBAction func touchUpInsideStart(_ sender: UIButton) {
        
        //self.timerLabel.text = ""
        //self.secondsValue = Int(self.datePicker.countDownDuration)
        
        //print(secondsValue)
        
        self.index = self.secondsValue
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer: Timer) in
            
            print(self.index)
            
            self.timerLabel.text = String(self.index)
            self.index -= 1
            self.currentIndex = self.index
            
            if self.index == 0 {
                timer.invalidate()
            }
            
            
        })
        
        self.timer?.fire() // 타이머 실행
        
    }
    
    @IBAction func touchUpInsideStop(_ sender: UIButton) {
        
        //self.timerLabel.text = ""
        
        if let currentTimer = self.timer {
            currentTimer.invalidate()
            //self.index = Int(self.timerLabel.text!)!
        }
        
        
        
    }
    
    @IBAction func touchUpInsideReset(_ sender: UIButton) {
        
        if let currentTimer = self.timer {
            currentTimer.invalidate()
        }
        
        self.timerLabel.text = ""
        
        self.index = 0
        self.timer = nil
        
        
        
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        
        print(sender.countDownDuration)
        
        //self.secondsValue = Int(sender.countDownDuration) - (Int(sender.countDownDuration) % 60)
        self.secondsValue = Int(sender.countDownDuration)
        print(self.secondsValue)
        
    }
    

}

