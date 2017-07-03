//
//  ViewController.swift
//  UIAnimationTest
//
//  Created by 정교윤 on 2017. 6. 29..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapGestureAction(_ sender: UITapGestureRecognizer) {
        
        var newFrame = self.imgView.frame
        
        newFrame.origin.x += 200
        
        let originFrame = self.imgView.frame
        
//        UIView.animate(withDuration: 2, delay: 0.5, options: [.curveEaseOut,.autoreverse], animations: {
//            
//            self.imgView.frame = newFrame
//            
//        }) { (isEnd) in
//            self.imgView.frame = originFrame
//        }
        
        
//        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.3, options: [.curveLinear], animations: {
//            self.imgView.frame = newFrame
//        }) { (isEnd) in
//            self.imgView.frame = originFrame
//        }
        
//        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.9, options: [.curveLinear], animations: {
//            
//            
//            
//            self.imgView.layer.transform = CATransform3DMakeScale(3, 3, 1)
//            self.imgView.alpha = 0.5
//            
//        }) { (isEnd) in
//            self.imgView.layer.transform = CATransform3DMakeScale(1/3, 1/3, 1)
//            self.imgView.alpha = 1
//        }
        
//                UIView.animate(withDuration: 2, delay: 0.5, options: [.curveEaseOut,.autoreverse], animations: {
//        
//                    self.imgView.layer.transform = CATransform3DMakeScale(3, 3, 1)
//                    self.imgView.alpha = 0.5
//        
//                }) { (isEnd) in
//                    self.imgView.layer.transform = CATransform3DMakeScale(1, 1, 1)
//                    self.imgView.alpha = 1
//                }
        
//        UIView.animate(withDuration: 1, animations: { 
//            self.imgView.layer.transform = CATransform3DMakeScale(3, 3, 1)
//            self.imgView.alpha = 0.5
//        }) { (isEnd) in
//            UIView.animate(withDuration: <#T##TimeInterval#>, animations: { 
//                self.imgView.layer.transform = CATransform3DMakeScale(1, 1, 1)
//                self.imgView.alpha = 1
//            }, completion: nil)
//        }
        
        
//        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (timer) in
//            UIView.animate(withDuration: 1, animations: {
//                self.imgView.layer.transform = CATransform3DMakeScale(3, 3, 1)
//                self.imgView.alpha = 0.5
//            }) { (isEnd) in
//                UIView.animate(withDuration: 1, animations: {
//                    self.imgView.layer.transform = CATransform3DMakeScale(1, 1, 1)
//                    self.imgView.alpha = 1
//                }, completion: nil)
//            }
//        }
        
        UIView.animate(withDuration: 1, animations: {
            self.imgView.layer.transform = CATransform3DMakeRotation(360*180/3.14, 1, 1, 0)
            self.imgView.alpha = 0.5
        }) { (isEnd) in
            UIView.animate(withDuration: 0.3, animations: {
                self.imgView.layer.transform = CATransform3DMakeRotation(360*180/3.14, 0, 0, 1)
                self.imgView.alpha = 1
            }, completion: nil)
        }

        
        
    }

}

