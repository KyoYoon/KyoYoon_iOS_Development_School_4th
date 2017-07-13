//
//  ViewController.swift
//  UIImageCocoapodTest
//
//  Created by 정교윤 on 2017. 7. 4..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit
import TLPhotoPicker

class ViewController: UIViewController, TLPhotosPickerViewControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func uploadImageButtonTouched(_ sender: UIButton) {
    }

}

