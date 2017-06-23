//
//  ViewController.swift
//  ClosureTestTwo
//
//  Created by 정교윤 on 2017. 6. 23..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

typealias Completion = (Bool) -> Void

class ViewController: UIViewController {

    let desceding = {(s1:Int, s2:Int) -> Bool in s1 > s2 }
    let ascending = {(s1:Int, s2:Int) -> Bool in s1 < s2 }
    
    @IBOutlet var mainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var currentValue = -4
        let moveNearerToZero = chooseStepFunction(backward: currentValue > 0) // 변수가 함수가 됨 (함수가 일급객체(first-class citizens)라서 가능함)
        // let moveNearerZero:(Int) -> Int 으로 써도 됨
        
        // moveNearerToZero now refers to the nested stepForward() function
        while currentValue != 0 {
            print("\(currentValue)...")
            currentValue = moveNearerToZero(currentValue)
        }
        
        //self.present(nextVC, animated:true, completion:( () -> void )? )
        
        //let alert = UIAlertAction(title: "알럿", style: .default, handler: ((UIAlertAction) -> Void)? )
        //UIView.animate(withDuration: 0.3, animations: () -> Void, completion: ((Bool) -> Void)?)
        
       // Element
        
        // func sorted(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element]
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        
        let sorted = names.sorted(by: backward)
        
        print(sorted)
        
        
        
        let action = UIAlertAction(title: "오케이", style: .default, handler: {(sender:UIAlertAction) in print("aaa") })
        
        let v = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        v.backgroundColor = .black
        
        mainView.addSubview(v)
        
        UIView.animate(withDuration: 3, animations: {() in
            v.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        }, completion: {(isSuccess:Bool) in
            UIView.animate(withDuration: 3, animations: {() in
                v.backgroundColor = .red
                v.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            }, completion: {(isSuccess:Bool) in
                UIView.animate(withDuration: 3, animations: {() in
                    v.backgroundColor = .blue
                    v.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
                }, completion: {(isSuccess:Bool) in
                    UIView.animate(withDuration: 3, animations: {() in
                        v.backgroundColor = .gray 
                        v.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
                    }, completion: {(isSuccess:Bool) in
                        print("success")
                    })
                })
            })
        })
        
        
        
        // inline closure
        let namesTwo = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        
        //아래 예제 backward(_:_:)는 이전 버전의 함수를 클로저식으로 나타낸 것입니다.
        let sortedTwo = namesTwo.sorted(by:
        {( s1: String, s2: String) -> Bool in
            return s1 > s2
        }
        )
        print(sortedTwo) //[“Ewa”, "Daniella", "Chris", "Barry", "Alex"]
        
        // Inferring Type From Context
        let namesThree = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        
        //아래 예제 backward(_:_:)는 이전 버전의 함수를 클로저식으로 나타낸 것입니다.
        let sortedThree = namesThree.sorted(by:{ s1, s2 in return s1 > s2 })
        print(sortedThree) //[“Ewa”, "Daniella", "Chris", "Barry", "Alex"]
        
        // implcit returns from single-expression closures
        let namesFour = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        //아래 예제 backward(_:_:)는 이전 버전의 함수를 클로저식으로 나타낸 것입니다.
        let sortedFour = namesFour.sorted(by:{ s1, s2 in s1 > s2 })
        print(sortedFour) //[“Ewa”, "Daniella", "Chris", "Barry", "Alex"]
        
        // Shorthand Argument Names
        let namesFive = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        //아래 예제 backward(_:_:)는 이전 버전의 함수를 클로저식으로 나타낸 것입니다.
        let sortedFive = namesFive.sorted(by:{ $0 > $1 })
        print(sortedFive) //[“Ewa”, "Daniella", "Chris", "Barry", "Alex"]
        
        // Trailing Closure
        let namesSix = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        //아래 예제 backward(_:_:)는 이전 버전의 함수를 클로저식으로 나타낸 것입니다.
        //let sorted = names.sorted { $0 > $1 }
        let sortedSix = namesSix.sorted() { $0 > $1 }
        print(sortedSix) //[“Ewa”, "Daniella", "Chris", "Barry", "Alex"]
        
        // Operator Method
        let namesSeven = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        //아래 예제 backward(_:_:)는 이전 버전의 함수를 클로저식으로 나타낸 것입니다.
        let sortedSeven = namesSeven.sorted(by: > )
        print(sortedSeven) //[“Ewa”, "Daniella", "Chris", "Barry", "Alex"]
        
        // 
        
        // 변수 할당
        let closureValue = {(name:String) in print(name) }
        closureValue("joo")
        
        
        let list = [1,2,3,4,5]
        let newList = list.sorted(by: desceding) // let ascending = {(s1:Int, s2:Int) -> Bool in s1 > s2 }
        //let desceding = {(s1:Int, s2:Int) -> Bool in s1 < s2 }
        
        print(newList)
        
        let add = {(f:Int, s:Int) -> Int in f + s}
        let minus = {(f:Int, s:Int) -> Int in f - s}
        let multiply = {(f:Int, s:Int) -> Int in f * s}
        let divide = {(f:Int, s:Int) -> Int in f * s}
        
        print( calculation(num1: 10, num2: 15, op: add) )
        print( calculation(num1: 10, num2: 15) {$0+$1} )
        print( calculation(num1: 12, num2: 14, op: +) ) // + 자체도 함수이다.
        
//        let testAction = testActionWithCompletion { (isSucess:Bool) in
//            if isSucess
//            {
//                
//            } else {
//                
//            }
//        }
//        
//        // 네트워크에서 주로 사용되는 패턴으로 클로져를 델리게이트 패턴처럼 써서 사용가능하다. ㅁ
//        let f = File()
//        
//        f.testActionWithCompletion { (isSuccess) in
//            if isSuccess
//            {
//            
//            } else {
//                
//            }
//        
//        }
        
        //var tmpTest:String = "sddff12345"
        
        // ARC - Auto Reference Count VS Reference Count used in Object C
        
        // 캡쳐 
        let incrementByTen = makeIncremeter(forIncrement: 10) // incrementByTen은 incrementer 함수를 얻어서 가지고 있다.
        // closure는 독립적으로 캡쳐라는 방식으로 메모리를 관리한다.
        
        print(incrementByTen())
        // returns a value of 10
        print(incrementByTen())
        // returns a value of 20
        print(incrementByTen())
        // returns a value of 30
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeIncremeter(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        func incremeter() -> Int {
            runningTotal += amount
            return runningTotal
        }
        
        return incremeter
    }
    
    func testActionWithCompletion(_ completion:(Bool) -> Void) {
        
        print("함수실행")
        
        // 일정 시간 동안 지연시킨다.
        sleep(1000)
        
        if true {  // true 대신 조건을 넣고 어떤 행동을 해라..
            completion(true)
        } else
        {
            completion(false) // 위에 위치한 호출부 안에 구현된 코드가 실행된다.
        }
    }
    
    func calculation(num1:Int, num2:Int, op:(Int,Int) -> Int) -> Int {
        return op(num1, num2)
    }
    
    func backward(_ s1:String, _ s2:String) -> Bool {
        return s1 > s2
    }
    
    func chooseStepFunction(backward:Bool) -> (Int) -> Int {
        func stepForward(input: Int) -> Int { return input + 1 }
        func stepBackward(input: Int) -> Int { return input - 1 }
        
        return backward ? stepBackward : stepForward // backward 가 true면 stepBackward 리턴, false면 stepForward를 리턴
    }
    
//    let f = testMethod()
//    
//    func testMethod() {
//        
//    }


}

let f1 = testFunc()


func testFunc()
{
    
}


