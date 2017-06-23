//
//  MovieData.swift
//  SettingPractice
//
//  Created by 정교윤 on 2017. 6. 22..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import Foundation

struct MovieData {
    let title:String
    let year:Int
    let genre:[MovieGenre]
    let director:[String]
    let stars:[String]
    let posterURL:String
    
    init(with dictionary:[String:Any]) {
        self.title = dictionary["title"] as? String ?? ""
        self.year = dictionary["year"] as? Int ?? 0
        
        
        var genreArray:[MovieGenre] = []
        
        if let genreStringArray = dictionary["genre"] as? [String] {
            
            for genreString in genreStringArray {
                genreArray.append(MovieGenre.init(rawValue: genreString)!)
            }
            
        }
        
        self.genre = genreArray
        
        self.director = dictionary["director"] as? [String] ?? []
        
        self.stars = dictionary["stars"] as? [String] ?? []
        
        self.posterURL = dictionary["posterUrl"] as? String ?? "" // placeholder image 추가
    
    }
    
}

enum MovieGenre:String {
    case action = "Action"
    case adventure = "Adventure"
    case sciFi = "Sci-Fi"
    
}

