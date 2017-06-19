//
//  ViewController.swift
//  StoringDataTest
//
//  Created by 정교윤 on 2017. 6. 16..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

// Singleton Pattern 예제
// 스크린 정보를 가지고 있는 객체 
// 내부로 들어가면 class로 선언되어 있는데 그 이유는 연산 프로퍼티이며 get only property이기 때문에 class 로 선언이 가능하다.
let screen = UIScreen.main // 자기가 자신의 인스턴스를 반환

// 사용자 정보를 저장하는 객체
let data = UserDefaults.standard

// 어플리케이션 객체
// 내부: open class var shared: UIApplication { get }
let app = UIApplication.shared

// 파일 시스템 정보를 가지고 있는 객체
// 내부: open class var `default`: FileManager { get } 연산 프로퍼티이므로 class로 선언이 가능하다.
let fileManager = FileManager.default

//if FileManager.default.fileExists(atPath: "/joo.png") {
//    
//}

class abc {
    
    var atype:String = ""
    
    //class var aaa = ""
    
    // class method => type method라고 부르고 오버라이드가 가능한 타입 메소드
    class func getAB() {
        var aa:String = "aa"
    }
    
    // instance method
    func getBC() {
        
    }
    
    // type method (오버라이드가 불가능한 타입 메소드)
    static func getDE() {
        var a:String = "aa"
    }
}

class ViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

