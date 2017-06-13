//
//  RoundButton.swift
//  CustomUITest
//
//  Created by 정교윤 on 2017. 6. 9..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class RoundButton: UIButton {
    
    override init(frame:CGRect) {
        
        super.init(frame:frame)
    }
    
    // 1번째 required init 실행
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    
    // 2번째 awakeFromNib 실행
    // ViewController에 UI 버튼 관련 코드를 추가하면 awakeFromNib이 실행되지 않음 
    // customized viewDidLoad 라고 보면 됨
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.red.cgColor
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
