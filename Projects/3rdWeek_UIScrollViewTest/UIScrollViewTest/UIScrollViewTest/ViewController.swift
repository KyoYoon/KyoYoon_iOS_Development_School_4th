//
//  ViewController.swift
//  UIScrollViewTest
//
//  Created by 정교윤 on 2017. 5. 29..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 스크롤뷰 만들기
//        let sc:UIScrollView = UIScrollView(frame: self.view.bounds)
//        
//        sc.contentSize = CGSize(width: self.view.bounds.width * 3, height: self.view.bounds.height)
//        sc.isPagingEnabled = true
//        sc.isScrollEnabled = true
//        sc.isOpaque = true
//        sc.alwaysBounceVertical = true
//        
//        
//        //sc.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0)
//        
//        sc.setContentOffset(CGPoint(x: 300, y: 0), animated: true) // 스크롤뷰의 현재 위치를 설정
//        
//        
//        self.view.addSubview(sc)
//        
//        let v1:UIView = UIView(frame: CGRect(x: self.view.bounds.width * 0, y: 0, width: sc.bounds.size.width - 10, height: sc.bounds.size.height - 10))
//        v1.backgroundColor = .yellow // UIColor.yellow 대신 타입추론으로 간략하게 쓸 수 있음
//        sc.addSubview(v1)
//        
//        let v2:UIView = UIView(frame: CGRect(x: self.view.bounds.width * 1, y: 0, width: sc.bounds.size.width, height: sc.bounds.size.height))
//        v2.backgroundColor = .red
//        sc.addSubview(v2)
//        
//        let v3:UIView = UIView(frame: CGRect(x: self.view.bounds.width * 2, y: 0, width: sc.bounds.size.width, height: sc.bounds.size.height))
//        v3.backgroundColor = .blue
//        sc.addSubview(v3)
        
        // 저장 
        //UserDefaults.standard.set("hihihi", forKey: "name")
        
        let name:String = UserDefaults.standard.string(forKey: "name")!
        
        print(name)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

