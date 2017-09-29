//
//  CustomUIView.swift
//  TwitterDynamicCellPractice
//
//  Created by 정교윤 on 2017. 7. 14..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class CustomUIView: UIView {
    
    var label: UILabel = UILabel()
    
    var textField: UITextField = UITextField()
    
    var cancelButton: UIButton = UIButton()
    
    var saveButton: UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addCustomView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addCustomView() {
        
        self.label.frame = CGRect(x: 50, y: 10, width: 200, height: 100)
        self.label.backgroundColor = UIColor.white
        self.label.textAlignment = NSTextAlignment.center
        self.label.text = "Compose"
        self.addSubview(self.label)
        
        self.textField.frame = CGRect(x: 50, y: 120, width: 200, height: 100)
        self.textField.layer.borderWidth = 1
        self.textField.layer.cornerRadius = 5
        self.textField.layer.borderColor = UIColor.gray.cgColor
        self.textField.backgroundColor = UIColor.white
        self.textField.textAlignment = NSTextAlignment.center
        self.textField.placeholder = "트윗으로 남길 말을 입력하세요."
        self.addSubview(self.textField)
        
        self.cancelButton.frame = CGRect(x: 50, y: 230, width: 90, height: 100)
        self.cancelButton.backgroundColor = UIColor.blue
        self.cancelButton.setTitle("CANCEL", for: .normal)
        //self.cancelButton.addTarget(self, action: Selector(("touchUpInsideCancelButton")), for: .touchUpInside)
        self.cancelButton.addTarget(self, action: #selector(CustomUIView.touchUpInsideCancelButton), for: .touchUpInside)
        self.addSubview(self.cancelButton)
        
        // #selector(CustomUIView.touchUpInsideCancelButton), forControlEvents: .touchUpInside
        
        self.saveButton.frame = CGRect(x: 150, y: 230, width: 90, height: 100)
        self.saveButton.backgroundColor = UIColor.blue
        self.saveButton.setTitle("SAVE", for: .normal)
        //self.saveButton.addTarget(self, action: Selector(("touchUpInsideSaveButton")), for: .touchUpInside)
        self.saveButton.addTarget(self, action: #selector(CustomUIView.touchUpInsideSaveButton), for: .touchUpInside)
        
        // #selector(CustomUIView.touchUpInsideSaveButton), forControlEvents: .touchUpInside
        self.addSubview(self.saveButton)
        
        // 0, 0, width: 400 / height: 480
        
    }
    
    func touchUpInsideCancelButton(sender: UIButton) {
        self.removeFromSuperview()
    }
    
    func touchUpInsideSaveButton(sender: UIButton) {
        self.removeFromSuperview()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
