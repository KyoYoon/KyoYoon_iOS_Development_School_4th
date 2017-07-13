//
//  CustomTableViewCell.swift
//  TwitterDynamicCellPractice
//
//  Created by 정교윤 on 2017. 7. 13..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageButton: UIButton!
    
    @IBOutlet weak var profileIdAndNameTextField: UITextField!
    
    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var userImageButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // 참고할 코드
//        profileImg.layer.cornerRadius = 40
//        profileImg.clipsToBounds = true
//        profileImg.setTitle("", for: .normal)
//        bodyImage.imageView?.contentMode = .scaleAspectFit
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func touchUpInsideProfileImageButton(_ sender: UIButton) {
    }
    
    @IBAction func touchUpInsideUserImageButton(_ sender: UIButton) {
    }
    
    func setProfileImage(_ image:String) {
        
        self.profileImageButton.setBackgroundImage(UIImage(named: image), for: .normal)
    }
    
    func setProfileIdAndName(_ text1:String, _ text2:String) {
        self.profileIdAndNameTextField.text = text1 + " " + text2
    }
    
    func setMyContentsTextView(_ text:String) {
        self.contentsTextView.text = text
    }
    
    func setUserImage(_ image:String) {
        
        self.userImageButton.setBackgroundImage(UIImage(named: image), for: .normal)
        
    }
    
    

}
