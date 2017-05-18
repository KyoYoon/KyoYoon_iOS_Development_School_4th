//
//  Charmander.swift
//  ClassExample2
//
//  Created by 정교윤 on 2017. 5. 18..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import Foundation

class Charmander {

    var name:String
    var hp:Int = 110 // 생명 수치
    var type:String = "전기"
    var skills:[[String:Any]] = [["name":"전기충격","damage":20],["name":"할퀴기","damage":20]]
    
    init() {
        
        name = "파이리"
    }
    
    func attack(toMoster monster:Pikachu, skill skillNum:Int)
    {
        
        let targetName = monster.name
        
        let skill:[String:Any] = skills[skillNum]
        let skillName:String = skill["name"] as! String
        
        /* as : 다운 케스팅*/
        print("\(self.name)이 \(targetName)에게 \(skillName)으로 공격합니다.")
        
        // skill["demage"] 가 Int가 되지 않을 수도 있기 때문에 !을 붙인다.
        let skillDemage:Int = skill["damage"] as! Int
        monster.hp -= skillDemage
        
    }

    
}
