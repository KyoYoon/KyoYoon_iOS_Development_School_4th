//
//  ViewController.swift
//  CustomUITest
//
//  Created by 정교윤 on 2017. 6. 9..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ItemViewDelegate {
    
    //@IBOutlet var circle1:CircleView!
    //@IBOutlet var circle2:CircleView!
    
    @IBOutlet var itemView1:ItemView!
    @IBOutlet var itemView2:ItemView! 

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //let roundBtn = RoundButton(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        //roundBtn.backgroundColor = .black
        //self.view.addSubview(roundBtn)
        //self.view.insertSubview(roundBtn, at: 0)
        
        // 위 2줄의 코드를 실행하면 awakeFromNiB 함수가 실행되지 않는다.
        
        // self.view.subviews
        
        //circle1.setTitleText("첫번째")
        //circle2.setTitleText("두번째")
        
        itemView1.setTitleText("First Item")
        itemView1.setImage("Image3")
        
        itemView1.delegate = self
        
        
        itemView2.setTitleText("Second Item")
        itemView2.setImage("Image4")
        
        itemView2.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // ItemView로 선언된 인스턴스가 넘어온다. => 버튼으로 감싼 뷰를 클릭했을 때
    func didSelectedItem(item: ItemView) {
        
        
        
        
        print(item.label?.text)
    }
    
    func isAbleToTouch() -> Bool {
        return true
    }

}

