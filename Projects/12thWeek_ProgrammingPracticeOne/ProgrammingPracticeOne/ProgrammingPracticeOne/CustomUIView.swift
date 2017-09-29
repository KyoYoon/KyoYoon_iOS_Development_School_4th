//
//  CustomUIView.swift
//  ProgrammingPracticeOne
//
//  Created by 정교윤 on 2017. 7. 28..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class CustomUIView: UIView {

    var delegate:CustomUIViewDelegate?
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let inBtn:UIButton = {
       
        let btn = UIButton()
        btn.setTitle("button", for: .normal)
        return btn
        
    }()
    
    // 델리게이트 구현 (2)
    func handle() {
        delegate?.didSelectedView(self)
    }

}

// 델리게이트 구현 (1)
@objc protocol CustomUIViewDelegate {
    
    func didSelectedView(_ view:CustomUIView)
    @objc optional func didSelectedViewTwo(_ view:CustomUIView)
}
