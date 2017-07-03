//
//  MyTableViewCell.swift
//  CollectionViewPractice
//
//  Created by 정교윤 on 2017. 7. 3..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var squareImageView: UIImageView!
    
    @IBOutlet weak var titleTextLabel: UILabel!
    
    @IBOutlet weak var subtitleTextLabel: UILabel!
    
    @IBOutlet weak var cellSwitchAcc: UISwitch!
    
    @IBOutlet weak var tableView: UITableView! 
    
    static let reuseId: String = "CustomCell"
    static let cellHeight: Double = 80.0
    
    @IBOutlet weak var cellSwitch: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
