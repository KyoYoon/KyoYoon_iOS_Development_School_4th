//
//  DataCenter.swift
//  SettingPractice
//
//  Created by 정교윤 on 2017. 6. 22..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import Foundation

class DataCenter {
    
    private static let sharedInstance:DataCenter = DataCenter.init()
    
    var movieDataArray:[MovieData] = []
    
    static var defaultCenter: DataCenter {
        
        get {
            return DataCenter.sharedInstance
        }
        
    }
    
    init() {
        let path = Bundle.main.path(forResource: "MovieList", ofType: "plist")!
        let rootArray:[[String:Any]] = NSArray(contentsOfFile: path) as! [[String:Any]]
        
        
        
        for movieDictionary in rootArray {
            movieDataArray.append(MovieData.init(with: movieDictionary))
        }
        
        
        
    }
    
}
