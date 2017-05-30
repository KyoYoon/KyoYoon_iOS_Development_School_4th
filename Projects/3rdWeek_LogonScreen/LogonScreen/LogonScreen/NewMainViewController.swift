//
//  NewMainViewController.swift
//  LogonScreen
//
//  Created by 정교윤 on 2017. 5. 30..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class NewMainViewController: UIViewController {

    var segment:Bool = true
    
    var dataFromNewMainViewController:String?
    
    @IBOutlet weak var textFieldInput: UITextField!
    
    @IBAction func valueChangedSegmentControl(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            segment = true
        } else {
            segment = false
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 1st case - Segue 제어 (아예 화면을 못 넘어가게 함)
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return segment // false 일 때는 화면이 넘어가지 않음
    }
    
    // 2nd case - Segue 제어 (데이터를 넘김)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc:NewMainSecondViewController = segue.destination as! NewMainSecondViewController
        
        let result:String = textFieldInput.text!
        
        vc.data = result
    }
    
    
    @IBAction func myUnwindAction(unwindSegue:UIStoryboardSegue) {
        
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
