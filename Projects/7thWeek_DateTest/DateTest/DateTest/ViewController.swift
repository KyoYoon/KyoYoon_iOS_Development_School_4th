//
//  ViewController.swift
//  DateTest
//
//  Created by 정교윤 on 2017. 6. 20..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var labelDate: UILabel!
    
    var dateFormatter:DateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //UIDatePicker
        
        //Date
        
        //DateFormatter
        
        dateFormatter.dateFormat = "yyyy년 M월 d일 a h시 m분"
        
        // 아아폰 설정 (Setting) 앱 실행해서 언어(Language)와 지역(Region)을 바꾸면 적용이 된다.
        dateFormatter.locale = Locale.current
        //dateFormatter.locale = Locale(identifier: "ko_KR")
        self.datePicker.date = Date()
        self.labelDate.text = self.dateFormatter.string(from: self.datePicker.date)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func valueChangedDatePicker(_ sender: UIDatePicker) {
        
        self.labelDate.text = self.dateFormatter.string(from: sender.date)
    }
    


}

