//
//  File.swift
//  ClosureTestTwo
//
//  Created by 정교윤 on 2017. 6. 23..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import Foundation

class File {
    
    func testActionWithCompletion(_ completion:(Bool) -> Void) {
        
        print("함수실행")
        
        sleep(1000)
        
        if true {
            completion(true)
        } else
        {
            completion(false)
        }
    }

    
}
