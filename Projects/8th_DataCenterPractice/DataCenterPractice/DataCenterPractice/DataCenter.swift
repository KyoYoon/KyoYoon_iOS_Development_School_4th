//
//  DataCenter.swift
//  DataCenterPractice
//
//  Created by 박종찬 on 2017. 6. 30..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
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
    
    private let fileManager:FileManager = FileManager()
    private let docPath: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! + "/Person.plist"
    
    
    private init() {
        if fileManager.fileExists(atPath: docPath) {
            loadFromDoc()
        } else {
            loadFromBundle()
        }
        
    }
    
    private func loadFromBundle() {
        let bundlePath: String = Bundle.main.path(forResource: "Person", ofType: "plist")!
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
    
    private func parsePersons(_ array: [[String:Any]]) {
        self.rawArray = array.map({ (dictionary: [String:Any]) -> Person in
            return Person.init(with: dictionary)
        })
    }
    
    private func saveToDoc() {
        let nsArray: NSArray = NSArray.init(array: self.rawArray.map({ (person: Person) -> [String:Any] in
            return person.dictionary
        }))
        nsArray.write(toFile: docPath, atomically: true)
    }
    
    func addPerson(_ dict:[String:Any]) {
        self.rawArray.append(Person.init(with: dict))
        self.saveToDoc()
    }
    
    func editPerson(_ dict:[String:Any], editId:Int) {
        
        var index:Int = 0
        
        print(editId)
        
        print(self.rawArray)
        
        for person in self.rawArray {
            
            
            
            if editId == person.id {
                print("exist")
                break
            }
            
            index += 1
            
        }
        
        print("Index: \(index)")
        
        self.rawArray[index] = Person.init(with: dict)
        
        self.saveToDoc()
        
    }
    
    func removePerson(_ dict:[String:Any], removeId:Int) {
        var index:Int = 0
        
        print(removeId)
        
        print(self.rawArray)
        
        for person in self.rawArray {
            
            
            
            if removeId == person.id {
                print("exist")
                break
            }
            
            index += 1
            
        }
        
        print("Index: \(index)")
        
        self.rawArray.remove(at: index)
        
        self.saveToDoc()
    }
    
    
}
