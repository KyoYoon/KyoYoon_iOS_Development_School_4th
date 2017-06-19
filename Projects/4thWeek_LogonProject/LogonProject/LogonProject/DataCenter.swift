//
//  DataCenter.swift
//  LogonProject
//
//  Created by 정교윤 on 2017. 6. 14..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import Foundation

class DataCenter {
    
    static let sharedInstance = DataCenter()
    
    func addUser(userData:[String:Any]) {
        UserDefaults.standard.set(userData, forKey: "user")
    }
    
    func loadUser(withID id:Int) -> [String:Any] {
        return UserDefaults.standard.dictionary(forKey: "user") as [String:Any]!
    }
}
