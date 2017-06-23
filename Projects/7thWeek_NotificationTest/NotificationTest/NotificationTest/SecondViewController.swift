//
//  SecondViewController.swift
//  NotificationTest
//
//  Created by 정교윤 on 2017. 6. 22..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

//typealias MyType = NSNotification.Name // NSNotification.name 을 MyType으로 부르겠다.

class SecondViewController: UIViewController {
    
    //let joo:MyType = MyType(rawValue: "joo")

    @IBOutlet weak var labelSecondView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        
        if sender.isOn {
            
            // typealias : 이름을 postNoti로 해서 등록하겠다.
            NotificationCenter.default.post(name: Notification.Name("postNoti"), object: "바뀌어라")
        } else {
            NotificationCenter.default.post(name: Notification.Name("postNoti"), object: "원래대로")
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
