//
//  ViewController.swift
//  PlistDataTest
//
//  Created by 정교윤 on 2017. 6. 19..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //let mainBundle = Bundle.main // singleton
        
//        let filePath = mainBundle.path(forResource: "rName", ofType: "rType")
//        
//        if let path = filePath {
//            let image = UIImage(contentsOfFile: filePath!)
//        }
        
        // Bundle에서 읽어오는 것 테스트
        
        if let filePath = Bundle.main.path(forResource: "FriendList", ofType: "plist"),
        let dict = NSDictionary(contentsOfFile: filePath) as? [String:AnyObject]{
            
            print(dict["list"] ?? "없음")
            
        } else {
            print("파일이 존재하지 않습니다.")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

