//
//  Person.swift
//  Closure
//
//  Created by youngmin joo on 2017. 6. 26..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import Foundation

//enum Gender:String
//{
//    case Man = "Mr."
//    case Woman = "Ms."
//}

enum Gender: Int {
    
    case woman = 0
    case man = 1

}

struct Person {
    
    let id: Int // Primary key
    let name: String
    let gender:Gender
    var age: Int
    var phoneNumber: String
    
    var dictionary: [String:Any] {
        
        get {
            return ["person_id":id, "name":name, "gender":gender.rawValue, "age":age, "phone_number":phoneNumber]
        }
    }
    
    // dictionary 를 받아 인스턴스로 변환
    init(withDictionary dictionary:[String:Any]) {
        
        self.id = dictionary["person_id"] as! Int
        self.name = dictionary["name"] as! String
        self.gender = Gender.init(rawValue: dictionary["gender"] as! Int)!
        
        self.age = dictionary["age"] as! Int
        self.phoneNumber = dictionary["phone_number"] as! String
        
        
    }
    
    
}

//struct DataKey {
//    
//    static let name:String = "name"
//    
//}
