//
//  ItemView.swift
//  CustomUITest
//
//  Created by 정교윤 on 2017. 6. 12..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

protocol ItemViewDelegate {
    func didSelectedItem(item:ItemView)
    
    func isAbleToTouch() -> Bool
}

class ItemView: UIView {
    
    var delegate:ItemViewDelegate?
    
    @IBOutlet var imgView:UIImageView?
    @IBOutlet var label:UILabel?
    
    @IBOutlet var coverBtn:UIButton?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        
        //self.backgroundColor = .red
        
        
    }
    
    func setTitleText(_ text:String) {
        
        if let titleLB = label {
            titleLB.text = text 
        }
        
    }
    
    func setImage(_ text:String) {
        
        if let imageView = imgView {
            imageView.image = UIImage(named: text)
        }
        
    }
    
    @IBAction func btnAction(_ sender:UIButton) {
        
        print("btn Action")
        
        if delegate?.isAbleToTouch() ?? false {
            delegate?.didSelectedItem(item: self)
        }
        
        
        
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}


