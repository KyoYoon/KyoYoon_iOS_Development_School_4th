//
//  ScoreManager.swift
//  ClassExample
//
//  Created by 정교윤 on 2017. 5. 17..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import Foundation

class ScoreManager {
    
    func average(forStudent student:Student) -> Double {
        
        var returnAverage:Double = 0.0
        
        if let subjects = student.subjects {
            
            var total:Int = 0
            
            for subject in subjects {
                total += subject.score
            }
            
            returnAverage = Double(total)/Double(subjects.count)
            
        }
        
        return returnAverage
        
    }
    
}
