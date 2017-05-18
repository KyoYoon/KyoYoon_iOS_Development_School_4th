//
//  ViewController.swift
//  ClassExample
//
//  Created by 정교윤 on 2017. 5. 17..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Hat class 선언 
        //let hat:Hat?
        
        // Student object 선언
        
        //let s1:Student = Student.init(name: "정교윤")
        let s1:Student = Student(name: "정교윤") // 리터럴 문법 
        // 타입추론으로 인해 let s1 = Studnet(name: "정교윤") 이렇게 쓸 수 있다.
        s1.add(subjectName: "수학", score: 99)
        s1.add(subjectName: "영어", score: 70)
        s1.add(subjectName: "국어", score: 78)
        s1.add(subjectName: "과학", score: 60)
        s1.add(subjectName: "사회", score: 95)
        
        let s2:Student = Student(name: "김선영")
        s2.add(subjectName: "수학", score: 80)
        s2.add(subjectName: "영어", score: 75)
        s2.add(subjectName: "국어", score: 87)
        s2.add(subjectName: "과학", score: 63)
        s2.add(subjectName: "사회", score: 93)

        let manager:ScoreManager = ScoreManager()
        
        let s1Average = manager.average(forStudent: s1)
        let s2Average = manager.average(forStudent: s2)
        
        print(s1Average)
        print(s2Average)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

