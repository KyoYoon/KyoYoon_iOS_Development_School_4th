//
//  DataCenter.swift
//  FriendList
//
//  Created by 정교윤 on 2017. 6. 30..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class DataCenter {
    
    static let shared: DataCenter = DataCenter.init()
    
    private var rawArray: [Person]!
    
    var dataArray: [Person] {
        get {
            return rawArray
        }
    }
    
    
    
    private let fileManager = FileManager()
    private let docPath: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! + "/Person.plist"
    
    private init() {
    
        if fileManager.fileExists(atPath: docPath) {
            loadFromDoc()
        } else {
            
            loadFromBundle()
            
        }

    
    }
    
    private func loadFromBundle() {
        let bundlePath = Bundle.main.path(forResource: "Person", ofType: "plist")!
        if let loadedArray = NSArray.init(contentsOfFile: bundlePath) as? [[String:Any]] {
            
            
            parsePersons(loadedArray)
            
        }
        
        
        try? fileManager.copyItem(atPath: bundlePath, toPath: docPath)
        
        print(self.rawArray)
    }
    
    private func loadFromDoc() {
        
        if let loadedArray = NSArray.init(contentsOfFile: docPath) as? [[String:Any]] {
            
            
            parsePersons(loadedArray)
            
        }
        
    }
    
    // dictionary 가지고 person 으로 만듦
    private func parsePersons(_ array: [[String:Any]]) {
        // for 문을 대체하는 효과
        self.rawArray = array.map({ (dictionary:[String:Any]) -> Person in
            return Person.init(withDictionary: dictionary)
        })
    }
    
    // Person 을 dictionary로 변환해서 저장
    private func saveToDoc() {
        
        let nsArray: NSArray = NSArray.init(array: self.rawArray.map({ (person) -> [String:Any] in
            return person.dictionary
        }))
        
        nsArray.write(toFile: docPath, atomically: true)
        
    }
    
    func addPerson(_ dict:[String:Any]) {
        self.rawArray.append(Person.init(withDictionary: dict))
        self.saveToDoc()
    }
    
}

