//
//  ViewController.swift
//  UserDefaultsTest
//
//  Created by 정교윤 on 2017. 5. 30..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelDisplayResult: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //데이터 저장
        //UserDefaults.standard.set("정교윤", forKey: "Name")
        //UserDefaults.standard.set("39", forKey: "Age")
        
        let name:String = UserDefaults.standard.object(forKey: "Name") as! String
        let age:String = UserDefaults.standard.object(forKey: "Age") as! String
        
        let result:String = "이름: \(name) \n 나이: \(age)"
        
        labelDisplayResult.text = result
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

