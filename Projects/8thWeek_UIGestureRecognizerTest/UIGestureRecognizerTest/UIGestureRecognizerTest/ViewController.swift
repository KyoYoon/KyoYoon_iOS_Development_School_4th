//
//  ViewController.swift
//  UIGestureRecognizerTest
//
//  Created by 정교윤 on 2017. 6. 29..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var frequencyLB: UILabel!
    
    @IBOutlet weak var coordinateLB: UILabel!
    
    @IBOutlet weak var gestureView: UIView!
    
    var frequency:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapGestureActon(_ sender:UIGestureRecognizer) {
        print("tap")
        
        frequency += 1
        
        self.frequencyLB.text = String(frequency)
        
        let position :CGPoint = sender.location(in: gestureView)
        
        // 손가락 2개 이상으로 터치하였을 때 아래의 함수를 사용해서 특정 손가락 1개가 터치한 위치를 가져온다.
        //sender.location(ofTouch: <#T##Int#>, in: <#T##UIView?#>)
        
        // Label, ImageView 자체는 UserInteraction 이 disabled라 UIGestureRecognizer의 액션을 먹지 않는데 뒤의
        // UIView에 전달해주기 때문에 탭은 먹는다.
        // 그러나, UITextField는 자신이 UserInteraction을 흡수하므로 뒤의 UIView에 전달하지 못해서 결국 액션이 적용되지 못한다.
        
        self.coordinateLB.text = "(" + String(describing: position.x) + "," + String(describing: position.y) + ")"
        
        //print(sender.state.rawValue)
        
        switch sender.state {
        case .began:
            print("began")
        case .changed:
            print("changed")
        case .ended:
            print("ended")
        default:
            print("default")
        }
        
        //self.gestureView.frame.origin.x
    }


}

