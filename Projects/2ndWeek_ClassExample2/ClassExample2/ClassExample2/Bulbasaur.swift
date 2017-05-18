//
//  Bulbasaur.swift
//  ClassExample2
//
//  Created by 정교윤 on 2017. 5. 17..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import Foundation

class Bulbasaur {
    //이상해씨
    //덩굴채찍 20
    //몸통박치기 20
    
    var name:String
    var hp:Int = 110 // 생명 수치
    var type:String = "전기"
    var skills:[[String:Any]] = [["name":"덩굴채찍","damage":20],["name":"몸통박치기","damage":20]]
    
    init() {
        
        name = "이상해씨"
    }
    
    func attack(toMoster monster:Bulbasaur, skill skillNum:Int)
    {
        
        let targetName = monster.name
        
        let skill:[String:Any] = skills[skillNum]
        let skillName:String = skill["name"] as! String
        
        /* as : 다운 케스팅*/
        print("\(self.name)이 \(targetName)에게 \(skillName)으로 공격합니다.")
        
        let skillDemage:Int = skill["damage"] as! Int
        monster.hp -= skillDemage
        
    }

    
    
}
