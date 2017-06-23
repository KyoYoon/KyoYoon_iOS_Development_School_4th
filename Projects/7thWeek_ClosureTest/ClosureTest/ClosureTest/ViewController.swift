//
//  ViewController.swift
//  ClosureTest
//
//  Created by 정교윤 on 2017. 6. 23..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(self.pickRandomLottoNumber())
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let alert:UIAlertController = UIAlertController.init(title: "test", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        
        // handler 안에 closure 구문 작성
        let okAction:UIAlertAction = UIAlertAction.init(title: "OK", style: UIAlertActionStyle.default,
                                                        handler: {
                                                            (sender:UIAlertAction) in
                                                            print("OK가 눌렸습니다.")})
        
        alert.addAction(okAction)
        // completion 안에 closure 구문 작성
        self.present(alert, animated: true, completion: { print("알러트가 프레젠트됨") })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickRandomLottoNumber() -> [Int] {
        
        var numberSet:Set<Int> = []
        
        while numberSet.count < 6 {
            numberSet.insert(Int(arc4random_uniform(UInt32(45)))+1) // 1 ~ 45 까지의 랜덤 숫자
        }
        
        // closure
        let resultArray = numberSet.sorted(by: { (num1:Int, num2:Int) -> Bool in
            return num1 < num2
        
        } )
        
        return resultArray
    }


}

