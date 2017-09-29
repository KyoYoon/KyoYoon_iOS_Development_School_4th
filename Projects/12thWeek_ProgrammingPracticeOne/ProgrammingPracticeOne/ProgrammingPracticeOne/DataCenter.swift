//
//  DataCenter.swift
//  ProgrammingPracticeOne
//
//  Created by 정교윤 on 2017. 7. 26..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import Foundation
import Firebase

class DataCenter {
    
    static let sharedData = DataCenter()
    
    var isLogin:Bool = false
        
    func requestIsLogin() -> Bool {
        
        if Auth.auth().currentUser == nil {
            isLogin = false
            return false
        } else {
            
            
            isLogin = true
            return true
        }
        
    }
    
    func requestUserData(completion: @escaping (_ info:User)->Void) {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        // 사용자 정보를 획득
        Database.database().reference().child(uid).child("UserInfo").observeSingleEvent(of: .value, with: { (snapshot) in
            
            let dic = snapshot.value as! [String:Any]
                    
            completion(User(data: dic))
        })
        
        
    }
    
}

struct User {
    
    var userName:String?
    var userProfileImageUrl:String?
    var email:String?
    
    // ["userName":userName, "profileImg":urlStr]
    init(data:[String:Any]) {
        self.userName = data["userName"] as? String ?? ""
        self.userProfileImageUrl = data["profileImg"] as? String ?? ""
        self.email = Auth.auth().currentUser?.email ?? ""
    }
    
}
