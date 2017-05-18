//
//  Poketmon.swift
//  ClassExample2
//
//  Created by 정교윤 on 2017. 5. 18..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import Foundation

// 포켓몬스터 자체를 정의한 부모 클래스
class Poketmon {
    
    var name:String
    var type:String // "전기"
    var hp:Int = 100 // 포켓몬스터의 생명수치
    
    var skills:[[String:Any]]?  // 포켓몬스터가 가진 공격기술명과 상대방 포켓몬스터에게 입힐 수 있는 데미지 점수
                                // [["name":"전기충격","damage":20],["name":"몸통박치기","damage":20]]
    var exp:Int = 0 // 포켓몬스터의 경험치
    
    
    init(name:String, type:String) {
        
        self.name = name
        self.type = type
    }
    
    func attack(toMoster monster:Pikachu, skill skillNum:Int)
    {
        
        // optional binding 이 되지 않는다면 함수 실행을 종료함
        guard let skillList = skills else {
            return
        }
        
        //let targetName = monster.name
        
        let skill:[String:Any] = skillList[skillNum]
        let skillName:String = skill["name"] as! String
        
        /* as : 다운 케스팅*/
        print("\(self.name)이 \(monster.name)에게 \(skillName)으로 공격합니다.")
        
        // skill["demage"] 가 Int가 되지 않을 수도 있기 때문에 !을 붙인다.
        let skillDemage:Int = skill["damage"] as! Int
        monster.hp -= skillDemage
        
    }
    
    
}
