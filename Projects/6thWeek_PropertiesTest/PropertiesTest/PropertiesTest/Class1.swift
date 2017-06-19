//
//  Class1.swift
//  PropertiesTest
//
//  Created by 정교윤 on 2017. 6. 14..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import Foundation

class Class1
{
    
    static func testS()
    {
        
    }
    
    class func testC()
    {
        
    }
    
}

class Class2:Class1
{
    
    // cannnot override static Method
//    override static func testS()
//    {
//        
//    }
    
    override class func testC()
    {
        
    }
    
}
