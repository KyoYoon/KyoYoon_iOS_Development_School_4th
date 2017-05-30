//
//  ViewController.swift
//  UIViewTest
//
//  Created by 정교윤 on 2017. 5. 22..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 객체 생성 1
        let newView = UIView(frame: CGRect(x: 15, y: 15, width: 345, height: 100))
        
        // 배경 색 변경
        newView.backgroundColor = UIColor.blue
        
        // 뷰 투명도 50%
        newView.alpha = 0.5
        
        // 화면 크기 구하기 
        
        
        // 객체 생성 2
        let newView2 = UIView(frame: CGRect(x: 15, y: self.view.frame.height-115, width: 345, height: 100))
        
        
        // 배경 색 변경
        newView2.backgroundColor = UIColor.brown
        
        // 뷰 투명도 50%
        newView2.alpha = 0.5
        
        // 메인 뷰에 추가할 레이블 생성 1
        let newLb = UILabel(frame: CGRect(x: 15, y: 130, width: 100, height: 20))
        
        newLb.text = "예제 화면입니다."
        newLb.textColor = UIColor.black
        newLb.textAlignment = NSTextAlignment.left
        newLb.font = UIFont.systemFont(ofSize: 10)
        
        // newView 에 추가할 레이블 생성 2
        let newLb2 = UILabel(frame: CGRect(x: 15, y: 15, width: 200, height: 20))
        
        newLb2.text = "서브 뷰 1에 추가된 텍스트"
        newLb2.textColor = UIColor.red
        newLb2.textAlignment = NSTextAlignment.left
        newLb2.font = UIFont.systemFont(ofSize: 15)
        
        newView.addSubview(newLb2)
        
        // newView2에 추가할 레이블 생성 3
        let newLb3 = UILabel(frame: CGRect(x: 15, y: 15, width: 200, height: 20))
        
        newLb3.text = "서브 뷰 2에 추가된 텍스트"
        newLb3.textColor = UIColor.cyan
        newLb3.textAlignment = NSTextAlignment.left
        newLb3.font = UIFont.systemFont(ofSize: 15)
        
        newView2.addSubview(newLb3)
        
        // 메인 뷰에 추가할 레이블 생성 4
        let newLb4 = UILabel(frame: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2, width: 200, height: 20))
        
        newLb4.text = "중앙에 표시된 텍스트"
        newLb4.textColor = UIColor.cyan
        newLb4.textAlignment = NSTextAlignment.center
        newLb4.font = UIFont.systemFont(ofSize: 15)
        
        // 메인 뷰에 서브 뷰 2개 추가
        self.view.addSubview(newView)
        self.view.addSubview(newView2)
        
        // 메인 뷰에 레이블 1개 추가
        self.view.addSubview(newLb)
        self.view.addSubview(newLb4)
        
        
        //self.view.frame.width
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

