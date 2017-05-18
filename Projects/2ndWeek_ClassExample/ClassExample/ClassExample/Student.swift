//
//  Student.swift
//  ClassExample
//
//  Created by 정교윤 on 2017. 5. 17..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import Foundation

class Student {
    var name:String
    var subjects:[Subject]?
    var average:Double?
    
    init(name:String) {
        self.name = name
    
        
    }
    
    func add(subjectName name:String, score:Int) {
        if subjects == nil {
            subjects = []
        }
        
        let sj:Subject = Subject(name: name, score: score)
        subjects?.append(sj)
        
        
    }
    
    
}
