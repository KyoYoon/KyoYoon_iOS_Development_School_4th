//
//  Pikachu.swift
//  ClassExample2
//
//  Created by 정교윤 on 2017. 5. 17..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import Foundation

class Pikachu : Poketmon {
    
    //피카츄 Pikachu
    //전기충격 20
    //몸통박치기 20
    //
    //라이츄 Raichu
    //전기충격 20
    //몸통박치기 20
    //십만볼트 50
    //번개 100
    //
    //이상해씨 Bulbasaur
    //덩굴채찍 20
    //몸통박치기 20
    //
    //이상해풀 Ivysaur
    //덩굴채찍 20
    //몸통박치기 20
    //잎날가르기 50
    //
    //이상해꽃 Venusaur
    //덩굴채찍 20
    //몸통박치기 20
    //잎날가르기 50
    //솔라빔 100
    //
    //파이리 Charmander
    //불꽃세례 20
    //할퀴기 20
    //
    //리자드 Charmeleon
    //불꽃세례 20
    //할퀴기 20
    //화염방사 50
    //
    //리자몽 Charizard
    //불꽃세례 20
    //할퀴기 20
    //화염방사 50
    //불대문자 100
    //
    //꼬부기 Squirtle
    //물대포 20
    //몸통박치기 20
    //
    //어니부기 Wartortle
    //물대포 20
    //몸통박치기 20s
    //파도타기 50
    //
    // 거북왕 Blastoise 
    //파도타기
    //물대포 20
    //몸통박치기 20
    //파도타기 50
    //하이드로펌프 100
    
    
    //var skills:[[String:Any]] = [["name":"전기충격","demage":10],["name":"몸통박치기","demage":20]]
    
    init() {
        super.init(name: "피카츄", type: "전기")
        hp = 110
        skills = [["name":"전기충격","demage":10,"property":"전기"],["name":"몸통박치기","demage":20,"property":"노멀"]]
    }
    
    override init(name: String, type: String) {
        super.init(name: name, type: type)
    }
    
    
//    func playCute()
//    {
//        guard let onwer = onwerTrainer else
//        {
//            return
//        }
//        //-----------------------------------------------//
//        print(onwer.name + "에게 재롱을 피기")
//        hp += 30
//        
//    }
    
    func ifSurf(taget monsterSkill:[String:String]) -> Bool {
        //기술 회피용
        let skillName:String = monsterSkill["name"]!
        if skillName == "홍수" {
            return true
        }else
        {
            return false
        }
    }
    
    func evolution() -> Raichu? {
        
        if exp >= 100 {
            let newRaichu:Raichu = Raichu()
            return newRaichu;
        }
        
        return nil
    }
    
    
    
}
