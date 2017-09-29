//
//  BasicCollectionViewCell.swift
//  CollectionViewTest
//
//  Created by youngmin joo on 2017. 7. 3..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class BasicCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var titleLb:UILabel!
    @IBOutlet var imgView:UIImageView!
    
    override func awakeFromNib() {
        let bgView = UIView()
        bgView.backgroundColor = .orange
        
        self.selectedBackgroundView = bgView
    }
    
    /**************/
    //Use Step1~ Step5
    func set(title:String)
    {
        self.titleLb.text = title
    }
    
    func set(image:UIImage)
    {
        imgView.image = image
    }
    /****************/
    
    
    
    //Make Step6
    /*
        타이틀과 이미지 셋팅하기
        디스패치 큐 사용해서 비동기 이미지 다운로드 하기
         <추가 기능 구현>
        *이미지 로딩전까지 디폴트 파일 배치
        *인디케이터 추가해보기
    */
    func set(title:String, imageUrl:String)  {
        
        // STEP 6 - 수정
        
        
        // 타이틀과 이미지 셋팅하기
        self.titleLb.text = title
        
        print("===loading Image(\(title))===")
        
        DispatchQueue.global().async {
            
            //print("image loading start")
            
            if let image = self.loadImage(url: imageUrl) {
                DispatchQueue.main.async {
                    self.imgView.image = image 
                }
                
                print("===loaded Image(\(title))===")
            }
            
            //print("image loading end")
        }
        
        
    }
    
    func loadImage(url: String) -> UIImage? {
        
        if let url = URL(string: url)
        {
            do{
                let realData =  try Data(contentsOf: url)
                
                
                
                return UIImage(data: realData)!
                
            }catch
            {
                return nil
            }
        }
        
        return nil
        
    }
    
}
