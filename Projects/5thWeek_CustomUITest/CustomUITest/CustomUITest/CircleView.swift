//
//  CircleView.swift
//  CustomUITest
//
//  Created by 정교윤 on 2017. 6. 12..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class CircleView: UIView {
    
    @IBOutlet var title:UILabel?
    @IBOutlet var okBtn:UIButton?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.frame.size.width / 2
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        
        self.backgroundColor = .red // 이 코드가 나중에 실행되면서 결국 배경색을 레드로 바꾼다. 첫 실행시에는 storyboard에 넣는 color가 설정됨
        
    }
    
    func setTitleText(_ text:String) {
        
        if let titleLB = title {
            titleLB.text = text 
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
