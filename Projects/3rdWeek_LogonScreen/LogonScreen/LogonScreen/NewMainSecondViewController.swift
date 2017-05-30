//
//  NewMainSecondViewController.swift
//  LogonScreen
//
//  Created by 정교윤 on 2017. 5. 30..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class NewMainSecondViewController: UIViewController {

    var data:String?
    
    @IBOutlet weak var labelResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let name = data {
            labelResult.text = name
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
