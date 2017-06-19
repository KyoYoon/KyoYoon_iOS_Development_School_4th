//
//  ViewController.swift
//  PropertiesTest
//
//  Created by 정교윤 on 2017. 6. 13..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center : Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

struct MyClass {
    private var total:Int = 0
    private var kScore:Int = 0
    private var eScore:Int = 0
    
    private var subjectCount:Int = 0
    private var isInputKScore:Bool = true
    private var isInputEScore:Bool = true
    
 
    
    var koreanScore:Int {
        get {
            return kScore
        }
        set (newScore) {
            
            if isInputKScore {
                if newScore <= 100 && newScore >= 0 {
                    kScore = newScore
                    total += newScore
                    subjectCount += 1
                    isInputKScore = false
                }
            }
            
        }
    }
    
    var englishScore:Int {
        get {
            return eScore
        }
        set (newScore) {
            
            if isInputEScore {
                if newScore <= 100 && newScore >= 0 {
                    eScore = newScore
                    total += newScore
                    subjectCount += 1
                    isInputEScore = false
                }
            }
            
        }
    }

    
    var average:Double {
//        get {
//            return Double(total)/Double(subjectCount)
//        }
        
        return Double(total)/Double(subjectCount) // 읽기 전용 프로퍼티시 get {} 는 생략해도 된다.
    }
}

// Property Observers 
var changeValue:Int = 0{
    didSet(oldV) { // 지정안하면 oldValue 로 셋팅
        print("oldValue: \(oldV)")
    }
    willSet(willV) {
        print("newValue: \(willV)")
    }
}

// Type Properties (1)
struct AudioChannel {
    
    static let level = 10
    static var maxLevel = 0
    var currentLevel:Int = 0 {
        didSet {
            if currentLevel > AudioChannel.level {
                currentLevel = AudioChannel.level
            }
            if currentLevel > AudioChannel.maxLevel {
                AudioChannel.maxLevel = currentLevel
            }
        }
    }
    
}

// Type Properties (2)
class AudioChannel2 {
    
    static let level = 10
    static var maxLevel = 0
    
    var currentLevel:Int = 0 {
        didSet {
            if currentLevel > AudioChannel2.level {
                currentLevel = AudioChannel2.level
            }
            if currentLevel > AudioChannel2.maxLevel {
                AudioChannel.maxLevel = currentLevel
            }
        }
    }

}

// self property
struct Point2 {
    var x = 0.0, y = 0.0
    func isToTheRightOf (x: Double) -> Bool {
        return self.x > x
    }
}

// 구조체 내에서 Value Type 프로퍼티 수정
struct Point3 {
    var x = 0.0, y = 0.0
    
    // 기본적으로 구조체와 열거형의 값타입 프로퍼티는 인스턴스 메소드 내에서 수정이 불가능하다. 
    // 다른 언어의 경우 구조체에 메소드를 넣는 것 자체가 불가능하다.
    // 그러나, 구조체 내에서 mutating keyword를 통해 메소드를 선언해서 값타입 프로퍼티를 수정하는 것은 허용이 된다.
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

struct Point4 {
    static var x = 0.0, y = 0.0 // 정적 변수 (클래스 이름.변수명)
    
    var z = 0.0 // 인스턴스 변수 (인스턴스 이름.변수명)
    
    // 기본적으로 구조체와 열거형의 값타입 프로퍼티는 인스턴스 메소드 내에서 수정이 불가능하다.
    // 다른 언어의 경우 구조체에 메소드를 넣는 것 자체가 불가능하다.
    // 그러나, 구조체 내에서 mutating keyword를 통해 메소드를 선언해서 값타입 프로퍼티를 수정하는 것은 허용이 된다.
    static func moveBy(x deltaX: Double, y deltaY: Double) {
        
        self.x += deltaX
        self.y += deltaY
        // self.z = 0.0 // 인스턴스화한 뒤 z에 접근가능
        
    }
    
    mutating func moveBy2(x deltaX: Double, y deltaY: Double) {
        self.z += deltaX
        
    }
}


class ViewController: UIViewController {

    // 정말 신기하다.
    private var pv:UIView!
    
    // 정말 이게 가능하다니.. 놀랍다.
    @IBOutlet weak var colorView: UIView! {
        get {
            return pv
        }
        set(newInstance) {
            newInstance.backgroundColor = .black
            pv = newInstance
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var rect = Rect(origin: Point(x:0, y:0), size: Size(width:100, height:100))
        
        let centerValue = rect.center
        let originValue = rect.origin
        
        print(centerValue)
        print(originValue)
        
        rect.center = Point(x: 100, y: 100)
        rect.size = Size(width: 100, height: 100)
        
        let newCenterValue = rect.center
        let newOrignValue = rect.origin
        
        print(newCenterValue)
        print(newOrignValue)
        
        var myScore = MyClass()
        
        myScore.koreanScore = 100
        myScore.koreanScore = 50 // 중복처리되어 있어서 넘어간다.
        print(myScore.average)
        
        myScore.englishScore = 80
        
        print(myScore.average)
        
        changeValue = 4
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

