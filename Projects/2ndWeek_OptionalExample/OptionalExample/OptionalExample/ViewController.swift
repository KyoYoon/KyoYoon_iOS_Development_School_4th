//
//  ViewController.swift
//  OptionalExample
//
//  Created by 정교윤 on 2017. 5. 17..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var friendList:[String]? // optional 로 선언
    
    var friendListDictionary:[[String:String]]? // optional로 선언
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("String 변수를 element 로 가지는 배열")
        
        addFriend(friend:"John")
        addFriend(friend:"Jane")
        
        printFriendList()
        
        print("Dictionary 변수를 element 로 가지는 배열")
        
        addFriendDictionary(name: "John", gender: "Male")
        addFriendDictionary(name: "Jane", gender: "Female")
        
        //printFriendListDictionary()
        
        let friendNames:[String] = getFriendNamesDictionary()
        
        //print(friendNames)
        
        for name in friendNames {
            print(name)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addFriend(friend:String) {
        if friendList == nil {
            friendList = []
            
        }
        
        friendList!.append(friend)

    }
    
    func printFriendList() {
        
        
        for friend in friendList! {
            print(friend)
        }
    }

    func addFriendDictionary(name:String, gender:String) {
        var friend:[String:String] = [String:String]()
        
        friend.updateValue(name, forKey: "name")
        friend.updateValue(gender, forKey: "gender")
        addFriend(friendData: friend)
    }
    
    func addFriend(friendData:[String:String]) {
        if friendListDictionary == nil {
            friendListDictionary = []
        }
        
        friendListDictionary!.append(friendData)
    }
    
    func getFriendNamesDictionary() -> [String]
    {
        
        guard let friends = friendListDictionary else {
            // 조건값이 거짓일 때 실행 => 보통 함수 실행을 종료하고 싶을 때 사용
            // friends 가 nil 일 때는 빈 배열을 반환하고 함수 실행을 종료함
            
            return []
        }
        
        
        
        var names:[String] = []
        
        //if let friends = friendListDictionary {
            
            for friend in friends {
                
                for (key,value) in friend {
                    if key == "name" {
                        names.append(value)
                    }
                    
                }
                
            }
            
        //}
        
        
        return names
    }
    
    func printFriendListDictionary() {
        if let friends = friendListDictionary {
            
            for friend in friends {
                
                for (key,value) in friend {
                    if key == "name" {
                        print(value)
                    }
                    
                }
                
            }
            
        }
    }

}

