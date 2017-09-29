//
//  ViewController.swift
//  GCDPractice
//
//  Created by 정교윤 on 2017. 7. 14..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // default 로 serial 로 처리함
        let queue1 = DispatchQueue(label: "com.closerExample.q1")
        queue1.async {
            for n in 1..<100 {
                print(n)
            }
        }
        
        queue1.async {
            for n in 100...200 {
                print(n)
            }
        }
        
        // 우선순위가 queue2 가 queue1 보다 높다. => default로 serial로 처리함
        let queue2 = DispatchQueue(label: "com.closerExample.q2", qos: .default)
        
        queue2.async {
            
            for n in 1000...1100 {
                print(n)
            }
            
        }
        
        let queue3 = DispatchQueue(label: "com.closerExample.q3", qos: .background, attributes: [.initiallyInactive,.concurrent])
        
        
        // 두 개의 큐가 번갈아가며 실행됨 <- concurrent queue
        queue3.async {
            
            for n in 6000...6500 {
                
                print(n)
                
            }
            
            print("end")
            //self.label.text = "end Thread" <- case 1
            
            // queue3 작업을 main queue로 보낸다. (UI 는 main thread에서만 동작) - case 2
            DispatchQueue.main.async {
                // self.label.text = "end Thread"
            }
            
        }
        
        queue3.activate()
        
        
        
//        queue3.async {
//            
//            for n in 6000...6100 {
//                print(n)
//            }
//            
//        }
        
//        let queue4 = DispatchQueue(label: "com.closerExample.q3", qos: .background, attributes: .initiallyInactive)
//        
//        // 두 개의 큐가 번갈아가며 실행됨 <- concurrent queue
//        queue4.async {
//            
//            for n in 7000...5100 {
//                print(n)
//            }
//            
//        }
//        
//        queue4.async {
//            
//            for n in 8000...6100 {
//                print(n)
//            }
//            
//        }
//        
//        queue4.activate() // 위의 옵션에서 .initiallyInactive 해놓으면 큐에 쌓아놓기만 하고 실행은 되지 않으므로 따로 activate() 로 실행 
//        
//        // .initaillyInactive 와 .concurrent를 동시에 주고 싶다. OptionSet 형태 [.initiallyInactive, .concurrent] 로 설정
//        let queue5 = DispatchQueue(label: "com.closerExample.q3", qos: .background, attributes: [.initiallyInactive,.concurrent])
//        
//        // 두 개의 큐가 번갈아가며 실행됨 <- concurrent queue
//        queue5.async {
//            
//            for n in 9000...9100 {
//                print(n)
//            }
//            
//        }
//        
//        queue5.async {
//            
//            for n in 10000...10100 {
//                print(n)
//            }
//            
//        }
        
        // UI를 할 때 Dispatch Queue에서 Main Queue로 보내줘야 한다.
        
        // main Queue - main Thread를 가리키는 queue => DispatchQueue.main 로 불러옴 DispatchQueue.main.async { }
        // global Queue - app 전역에 사용되는 queue로써 concurrent 방식의 queue이다. 
        // option으로 qos를 설정할 수 있다.
        
        
        

        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

