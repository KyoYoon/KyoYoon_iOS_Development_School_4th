//
//  MyTableViewCell.swift
//  CustomTableViewCellTest
//
//  Created by 정교윤 on 2017. 6. 12..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet var imgView:UIImageView?
    @IBOutlet var labelText:UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setImages(_ text:String) {
        
        if let img = imgView {
            img.image = UIImage(named: text)
        }
        
    }
    
    func setRowTitle(_ text:String) {
        
        if let textLB = labelText {
            textLB.text = text 
        }
        
    }

}
