//
//  DataCenter.swift
//  CollectionViewPracticeTwo
//
//  Created by 정교윤 on 2017. 7. 3..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import Foundation
import UIKit

class DataCenter {
    static let center = DataCenter()
    
    var friendList = ["A","B","C","D","E","F","G","H","I"]
    
    var girlGroupImage = [
        UIImage(named: "BackImage1.png")!,
        UIImage(named: "BackImage2.png")!,
        UIImage(named: "BackImage3.png")!,
        UIImage(named: "BackImage4.png")!,
        UIImage(named: "BackImage5.png")!,
        UIImage(named: "BackImage6.png")!,
        UIImage(named: "BackImage7.png")!,
        UIImage(named: "BackImage8.png")!,
        UIImage(named: "BackImage9.png")!
    ]
    
    
    
    func insertItems(at items:[IndexPath]) {
        
//        let nsArray: NSArray = NSArray.init(array: self.rawArray.map({ (person: Person) -> [String:Any] in
//            return person.dictionary
//        }))
        
        // 구현부 만들기
        //var duplicateItems:[String]?
        
//        var duplicateFriends:[String] = []
//        var duplicateImages:[UIImage] = []
//        
//        for item in items {
//            
//            let friend:String = friendList[item.item]
//            let girlGroup:UIImage = girlGroupImage[item.item]
//            
//            duplicateFriends.append(friend)
//            duplicateImages.append(girlGroup)
//            
//            
//        }
//        
//        //print(items.last?.item)
//        
//        friendList.insert(contentsOf: duplicateFriends, at: (items.last?.item)!+1)
//        girlGroupImage.insert(contentsOf: duplicateImages, at: (items.last?.item)!+1)
        
        print(items)
        
        let selectedFriendList:[String] = items.map { (indexPath) -> String in
            return friendList[indexPath.item]
        }.sorted(by: >)
        
        friendList.insert(contentsOf: selectedFriendList, at: (items.last?.item)!+1)
        
        print(friendList)
        
        let selectedGirlGroupImageList:[UIImage] = items.map { (indexPath) -> UIImage in
            return girlGroupImage[indexPath.item]
        }
        
        girlGroupImage.insert(contentsOf: selectedGirlGroupImageList, at: (items.last?.item)!+1)
        
        //print(friendList)

        
        
        //print(girlGroupImage)
        
    }
    
    
}
