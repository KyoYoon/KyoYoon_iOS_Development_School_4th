//
//  SwitchTableViewCell.swift
//  SettingProjectPairProgramming
//
//  Created by 정교윤 on 2017. 6. 21..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLB: UILabel!
    @IBOutlet weak var switchValue: UISwitch!
    var delegate: SwitchCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func switchValueChanged(_ sender: UISwitch) {
        self.switchValue.isOn = sender.isOn
        delegate?.cellValueChanged(cell: self, isOn: switchValue.isOn)
    }
    
    
    func setTitle(text: String) {
        self.titleLB.text = text
    }
    
    func setSwitch(isOn: Bool) {
        self.switchValue.isOn = isOn 
    }
    
}


protocol SwitchCellDelegate {
    func cellValueChanged(cell: SwitchTableViewCell, isOn: Bool)
}
