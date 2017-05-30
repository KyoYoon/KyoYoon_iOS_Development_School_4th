//
//  ViewController.swift
//  ClassAndObjectExample
//
//  Created by 정교윤 on 2017. 5. 24..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // struct
        var b1:Book = Book(name: "책이름1", cost: 1000, isbn: 1)
        var b2 = b1 // 복사
        
        b2.name = "톰소여의 모험"
        
        print(b1.name)
        print(b2.name)
        
        // class
        let bs1:BookStore = BookStore(name: "신사점", address: "신사동어딘가")
        let bs2 = bs1 // 덮어쓰기 (같은 인스턴스)
        let b3:BookStore = BookStore(name: "압구정점", address: "압구정 어딘가") // bs1과 다른 별도의 인스턴스
        bs2.name = "영등포점"
        
        print(bs1.name)
        print(bs2.name)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

