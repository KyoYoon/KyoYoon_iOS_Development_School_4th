//
//  ViewController.swift
//  PlistDataTest
//
//  Created by 정교윤 on 2017. 6. 19..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let listName = "list"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //let mainBundle = Bundle.main // singleton
        
//        let filePath = mainBundle.path(forResource: "rName", ofType: "rType")
//        
//        if let path = filePath {
//            let image = UIImage(contentsOfFile: filePath!)
//        }
        
        // Bundle에서 읽어오는 것 테스트
        
//        if let filePath = Bundle.main.path(forResource: "FriendList", ofType: "plist"),
//        let dict = NSDictionary(contentsOfFile: filePath) as? [String:AnyObject]{
//            
//            print(dict["list"] ?? "없음")
//            
//        } else {
//            print("파일이 존재하지 않습니다.")
//        }
//        
//        print("-------------")
        
        // plist file in Document
//        let path:[String] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
//        let basePath = path[0] + "/filename.plist"
//        
//        print(path[0])
//        
        // document에 파일이 존재하지 않는다면 if 안의 구문을 실행
//        if !FileManager.default.fileExists(atPath: basePath) {
//            
//            if let fileUrl = Bundle.main.path(forResource: "fileName", ofType: "plist") {
//                do {
//                    //try FileManager.default.copyItem(at: fileUrl, to: basePath)
//                } catch {
//                    print("fail!")
//                }
//            }
//            
//        }
        
        // plist file in Document
//        writeToFile2()
        
        //FriendData.standard.set("joo" as AnyObject, forKey: "kiki")
        //FriendData.standard.object(forKey: "kiki")
        
        print("Contents in Document folder")
        
        FriendData.standard.printFriendDictionary()
        
        print()
        print("append dictionary as a new item")
        
        
        var itemDic:[String:AnyObject] = [:]
        
        itemDic.updateValue("Jane" as AnyObject, forKey: "name")
        itemDic.updateValue("22" as AnyObject, forKey: "age")
        itemDic.updateValue("image3" as AnyObject, forKey: "img_url")
        itemDic.updateValue("010-3455-9999" as AnyObject, forKey: "phone_number")
        itemDic.updateValue("Seoul" as AnyObject, forKey: "address")
        
        
        
        FriendData.standard.appendDictionaryInArray(itemDic: itemDic, listName: listName)
        
        FriendData.standard.printFriendDictionary()
        print()
        
        print("insert dictionary as a new item at a special index")
        
        var itemDic2:[String:AnyObject] = [:]
        
        itemDic2.updateValue("John" as AnyObject, forKey: "name")
        itemDic2.updateValue("27" as AnyObject, forKey: "age")
        itemDic2.updateValue("image5" as AnyObject, forKey: "img_url")
        itemDic2.updateValue("010-7777-8889" as AnyObject, forKey: "phone_number")
        itemDic2.updateValue("Pusan" as AnyObject, forKey: "address")
        
        FriendData.standard.insertDictionaryInArray(itemDic: itemDic2, at: 0, listName: listName)
        
        FriendData.standard.printFriendDictionary()
        
        print()
        
        print("display dictionary at a special index")
        
        let itemDic3:[String:AnyObject] = FriendData.standard.getDictionaryFromArray(at: 0, listName: listName)!
        
        print(itemDic3)
        
        print()
        
        print("remove dictionary at a special index")
        
        FriendData.standard.removeDictionaryFromArray(at: 0, listName: listName)
        
        FriendData.standard.printFriendDictionary()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func writeFile() {
        
        //UserDefaults
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let realPath = path[0] + "/FriendList.plist"
        
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: realPath) {
            
            if let bundlePath = Bundle.main.path(forResource: "FriendList", ofType: "plist") {
                
                do {
                    try fileManager.copyItem(atPath: bundlePath, toPath: realPath)
                } catch {
                    return
                }
                
                
            } else {
                return
            }
            
        }
        
        let dic = NSDictionary(contentsOfFile: realPath) as? [String:AnyObject]
        
        let nsDic = NSDictionary(dictionary: dic!)
        
        nsDic.write(toFile: realPath, atomically: true)
        
        print(nsDic)
        
        
    }
    
    func writeToFile2() {
        
        // 파일 경로 파악
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let realPath = path[0] + "/FriendList.plist"
        
        // 실제 파일 존재 여부 파악 
        // 만약에 없다면 번들에 있는 파일을 복사
        if !FileManager.default.fileExists(atPath: realPath) {
            if let bundlePath = Bundle.main.path(forResource: "FriendList", ofType: "plist") {
                do {
                    try FileManager.default.copyItem(atPath: bundlePath, toPath: realPath)
                } catch {
                    return
                }
            } else {
                return
            }
        }
        
        // 딕셔너리 인스턴스 만들기
        let dic = NSDictionary(contentsOfFile: realPath) as? [String:AnyObject]
        
        // 딕셔너리 인스턴스 저장 
        let nsDic = NSDictionary(dictionary: dic!)
        
        // 여러 개의 thread가 돌아가는 상태에서 동시에 write를 하면 dead lock이 발생하므로 이를 방지하기 위해
        // atomically를 true로 설정하여 관리를 한다.
        nsDic.write(toFile: realPath, atomically: true)
        
        print(nsDic)
        
    }


}

