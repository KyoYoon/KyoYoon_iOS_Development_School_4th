//
//  MyTableViewCell.swift
//  TodayDiary
//
//  Created by 정교윤 on 2017. 6. 14..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell, UITextViewDelegate {
    
    @IBOutlet var textView:UITextView? // 일기쓰는 내용
    @IBOutlet var labelDayText:UILabel? // 날짜
    
    let limitLength:Int = 200

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        textView?.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        textView?.becomeFirstResponder()
    }
    
    func setRowTextViewContent(_ text:String) {
        
        if let txtTV = textView {
            txtTV.text = text 
        }
        
    }
    
    // 날짜 찍어준다. (1 ~ 31)
    func setRowDayTitle(_ text:String) {
        
        if let textLB = labelDayText {
            textLB.text = text
        }
        
    }
    
    // 200자수 입력제한
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        print("textView - shouldChangeTextIn")
        
        guard let currentText = textView.text else { return true }
        let newLength = currentText.characters.count + text.characters.count - range.length
        return newLength <= limitLength
    }


}
