//
//  SettingSwitchCell.swift
//  SettingTest
//
//  Created by 정교윤 on 2017. 6. 20..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class SettingSwitchCell: UITableViewCell {
    
    @IBOutlet var switcher:UISwitch!
    @IBOutlet var titleLb:UILabel!
    
    
    
    var delegate:SettingSwitchCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTitle(_ title:String) {
        self.titleLb.text = title
    }
    
    @IBAction func switchValueChanged(_ selected: UISwitch) {
        
        delegate?.switchCellValueChanged(self, isOn: selected.isOn)
    }

}

protocol SettingSwitchCellDelegate {
    func switchCellValueChanged(_ cell:SettingSwitchCell, isOn:Bool)

}
