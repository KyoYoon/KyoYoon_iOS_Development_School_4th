//
//  ViewController.swift
//  UIControlTest
//
//  Created by 정교윤 on 2017. 6. 19..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var indicatorValue: UIActivityIndicatorView!
    
    @IBOutlet weak var labelSliderValue: UILabel!
    
    @IBOutlet weak var labelSwitchValue: UILabel!
    
    
    
    
    @IBAction func valueChangedSwitch(_ sender: UISwitch) {
        
//        if sender.isOn == true {
//            <#code#>
//        }
        
        self.labelSwitchValue.text = String(sender.isOn)
    }
    
    @IBAction func valueChangedUISlider(_ sender: UISlider) {
        
        
        self.labelSliderValue.text = String(sender.value)
    }
    
    
    @IBAction func touchUpInsideStartIndicator(_ sender: UIButton) {
        
        if !sender.isSelected {
            self.indicatorValue.startAnimating()
            sender.isSelected = true
        } else {
            self.indicatorValue.stopAnimating()
            sender.isSelected = false 
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

