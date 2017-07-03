//
//  MyCollectionViewCell.swift
//  CollectionViewPracticeTwo
//
//  Created by 정교윤 on 2017. 7. 3..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var titleLb:UILabel!
    
    @IBOutlet var imageView:UIImageView!
    
    // 인스턴스가 최초로 생성되는 곳 
    // Nib 파일이 만들어진 직후 처음 부르는 함수가 awakeFromNib 이다.
    // 한 번 눌렀을 때 orange로 바뀌고 두 번 눌렀을 때에는 자동으로 hidden으로 셋팅되면서 orange가 white로 바뀐다. 
    override func awakeFromNib() {
        let bgView = UIView()
        
        bgView.backgroundColor = .orange
        
        self.selectedBackgroundView = bgView
    }
    
    func set(title: String) {
        self.titleLb.text = title
        
        
    }
    
    func set(image: UIImage) {
        self.imageView.image = image
    }
    
    
    
}
