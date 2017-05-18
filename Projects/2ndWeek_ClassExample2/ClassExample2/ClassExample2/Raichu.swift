//
//  Raichu.swift
//  ClassExample2
//
//  Created by 정교윤 on 2017. 5. 17..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import Foundation

class Raichu {

    //라이츄
    //전기충격 20
    //몸통박치기 20
    //십만볼트 50
    //번개 100
    //
    
    var name:String
    var hp:Int = 110 // 생명 수치
    var type:String = "전기"
    var skills:[[String:Any]] = [["name":"전기충격","damage":20],["name":"몸통박치기","damage":20],["name":"십만볼트","damage":50],["name":"번개","demage":100]]
    
    init() {
        
        name = "라이츄"
    }
    
    func attack(toMoster monster:Raichu, skill skillNum:Int)
    {
        
        let targetName = monster.name
        
        let skill:[String:Any] = skills[skillNum]
        let skillName:String = skill["name"] as! String
        
        /* as : 다운 케스팅 */
        print("\(self.name)이 \(targetName)에게 \(skillName)으로 공격합니다.")
        
        let skillDemage:Int = skill["damage"] as! Int
        monster.hp -= skillDemage
        
    }
    
    
}
