//
//  ViewController.swift
//  UIImageViewTest
//
//  Created by 정교윤 on 2017. 5. 22..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let newImgV = UIImageView(frame: CGRect(x: 15, y: 15, width: 90, height: 90))
        
        newImgV.image = UIImage(named: "matrix_img1.png")
        newImgV.clipsToBounds = true
        newImgV.contentMode = UIViewContentMode.scaleToFill // default
        //newImgV.contentMode = UIViewContentMode.scaleAspectFill
        //newImgV.contentMode = UIViewContentMode.scaleAspectFit
        
        let newImgV2 = UIImageView(frame: CGRect(x: 15, y: 115, width: 90, height: 90))
        
        newImgV2.image = UIImage(named: "matrix_img2.png")
        newImgV2.contentMode = UIViewContentMode.scaleAspectFit

        let newImgV3 = UIImageView(frame: CGRect(x: 15, y: 215, width: 90, height: 90))
        
        newImgV3.image = UIImage(named: "matrix_img3.png")
        newImgV3.contentMode = UIViewContentMode.scaleAspectFit
        
        let newImgV4 = UIImageView(frame: CGRect(x: 15, y: 315, width: 200, height: 200))
        
        newImgV4.image = UIImage(named: "Twice")
        newImgV4.contentMode = UIViewContentMode.scaleAspectFit
    
        self.view.addSubview(newImgV)
        self.view.addSubview(newImgV2)
        self.view.addSubview(newImgV3)
        self.view.addSubview(newImgV4)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

