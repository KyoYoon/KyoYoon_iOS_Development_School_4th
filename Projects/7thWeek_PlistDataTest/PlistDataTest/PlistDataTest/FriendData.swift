//
//  FriendData.swift
//  PlistDataTest
//
//  Created by 정교윤 on 2017. 6. 19..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import Foundation



class FriendData {
    
    
    
    private let fileName = "FriendList"
    private let fileType = "plist"
    private let fullFileName = "FriendList.plist"
    
    private let listName = "list" // FriendList.plist 파일에 있는 Root라는 딕셔너리에 엘리먼트로 존재하는 Array 의 이름
    
    private var friendDictionaryArray:[[String:AnyObject]]?
    private var friendDictionary:[String:AnyObject]?
    private static let sharedInstance = FriendData() // singleton instance creation
    
    // return singleton instance
    // calculation property만 class로 선언하여 쓸 수 있음 -> get-only property
    class var standard:FriendData{
        return sharedInstance
    }
    
    init() {
        load()
    }
    
    deinit {
        save()
    }
    
    func getRealPath(fullFileName:String) -> String {
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let realPath = path[0] + "/" + fullFileName
        
        return realPath
    }
    
    // docuemnt folder에 파일 있는지 확인 후 없으면 bundle에 있는 파일을 document에 복사해서 생성 후 로드
    func load() {
        
        print("load")
        
        let realPath = getRealPath(fullFileName: fullFileName)
        
        print(realPath)
        
        if !FileManager.default.fileExists(atPath: realPath) {
            print("exist")
            if let fileUrl = Bundle.main.path(forResource: fileName, ofType: fileType) {
                do {
                    print("copied")
                    try FileManager.default.copyItem(atPath: fileUrl, toPath: realPath)
                } catch {
                    return
                }
            } else {
                return
            }
        }
        
        
        
        self.friendDictionary = NSDictionary(contentsOfFile: realPath) as? [String:AnyObject]
        
        //print(friendDictionary ?? "없음")
    }
    
    func save() {
        let realPath = getRealPath(fullFileName: fullFileName)
        
        // NSDictionary(contentsOfFile: realPath) as? [String:AnyObject]
        
        if !FileManager.default.fileExists(atPath: realPath) {
            if let fileUrl = Bundle.main.path(forResource: fileName, ofType: fileType) {
                do {
                    print("copied")
                    try FileManager.default.copyItem(atPath: fileUrl, toPath: realPath)
                } catch {
                    return
                }
            } else {
                return
            }
        }

        
        if let saveData = friendDictionary {
            let nsDic:NSDictionary = NSDictionary(dictionary: saveData)
            nsDic.write(toFile: realPath, atomically: true)
        } else {
            if let saveData = NSDictionary(contentsOfFile: realPath) as? [String:AnyObject] {
                let nsDic:NSDictionary = NSDictionary(dictionary: saveData)
                nsDic.write(toFile: realPath, atomically: true)
            }
        }
    }
    
    // 화면이 뒤로 넘어갈 때 강제로 세이브 
    func friendDataSave() {
        save()
    }
    
    // Dictionary 추가 
//    func appendDictionary(_ value: AnyObject?, forKey defaultName: String) {
//        
//        guard let _ = friendDictionary,
//            let realValue = value
//            else {
//                return
//        }
//        
//        friendDictionary![defaultName] = realValue
//
//        
//    }
    
    // Dictionary 추가 - append
    func appendDictionaryInArray(itemDic:[String:AnyObject], listName:String) {
        
        let realPath = getRealPath(fullFileName: fullFileName)
        
        
        friendDictionaryArray = friendDictionary![listName] as? [[String:AnyObject]]
        
        if friendDictionaryArray == nil {
            return
        } else {
            friendDictionaryArray?.append(itemDic)
            
            friendDictionary?.updateValue(friendDictionaryArray! as AnyObject, forKey: listName)
            
            // file write
            let nsDic:NSDictionary = NSDictionary(dictionary: friendDictionary!)
            nsDic.write(toFile: realPath, atomically: true)
        }
        
        
    }

    

    
    // Dictionary 추가 => insert
    func insertDictionaryInArray(itemDic:[String:AnyObject], at:Int, listName:String) {

        let realPath = getRealPath(fullFileName: fullFileName)
        
        
        friendDictionaryArray = friendDictionary![listName] as? [[String:AnyObject]]
        
        if friendDictionaryArray == nil || friendDictionaryArray?.count == 0 {
            return
        } else {
            friendDictionaryArray?.insert(itemDic, at: at)
            friendDictionary?.updateValue(friendDictionaryArray! as AnyObject, forKey: listName)
            
            // file write
            let nsDic:NSDictionary = NSDictionary(dictionary: friendDictionary!)
            nsDic.write(toFile: realPath, atomically: true)
            
        }
        
        
        
        
        
    }
    
    // list라는 어레이로부터 해당 Dictionary 삭제
    func removeDictionaryFromArray(at:Int, listName:String) {
        let realPath = getRealPath(fullFileName: fullFileName)
        
        friendDictionaryArray = friendDictionary![listName] as? [[String:AnyObject]]
        
        if friendDictionaryArray == nil || friendDictionaryArray?.count == 0 {
            return
        } else {
            friendDictionaryArray?.remove(at: at)
            friendDictionary?.updateValue(friendDictionaryArray! as AnyObject, forKey: listName)
            
            // file write
            let nsDic:NSDictionary = NSDictionary(dictionary: friendDictionary!)
            nsDic.write(toFile: realPath, atomically: true)
            
        }
        
    }
    
    // list라는 어레이에 있는 해당 dictionary 가져오기
    func getDictionaryFromArray(at:Int, listName:String) -> [String : AnyObject]? {
        
        if friendDictionaryArray == nil || friendDictionaryArray?.count == 0 {
            return [:]
        } else {
            let dict:[String:AnyObject] = (friendDictionary![listName] as! [[String:AnyObject]])[at]
            
            return dict
        }
        
        
    }
    
    // 특정 이름을 가지고 해당 딕셔너리의 내용을 전부 업데이트함 
    func updateDictionaryUsingNameFromArray(name:String, itemDic:[String:AnyObject], listName:String) {
        let realPath = getRealPath(fullFileName: fullFileName)
        
        let compareName = name
        
        var index = 0
        
        friendDictionaryArray = friendDictionary![listName] as? [[String:AnyObject]] // [Any] => [[String:Any]]
        
        if friendDictionaryArray == nil || friendDictionaryArray?.count == 0 {
            return
        } else {
            //friendDictionaryArray?.remove(at: at)
            
            for friend in friendDictionaryArray! {
                
                index += 1
                
                let name = friend["name"] as! String
                
                if name == compareName {
                    
                    break
                }
            }
            
            friendDictionaryArray?[index] = itemDic
            
            friendDictionary?.updateValue(friendDictionaryArray! as AnyObject, forKey: listName)
            
            // file write
            let nsDic:NSDictionary = NSDictionary(dictionary: friendDictionary!)
            nsDic.write(toFile: realPath, atomically: true)
            
        }

    }
    
    // 전체 딕셔너리 프린트 
    func printFriendDictionary() {
        print(friendDictionary ?? "없음")
    }
    

}
