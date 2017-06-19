//
//  ViewController.swift
//  RecursiveEnumerationsTest
//
//  Created by 정교윤 on 2017. 6. 14..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

enum Wearable {
    enum Weight:Int {
        case Light = 1
    }
    enum Armor:Int {
        case Light = 2
    }
    
    case Helmet(weight: Weight, armor: Armor)
    
    
    func attributes() -> (weight: Int, armor:Int) {
        switch self {
        case .Helmet(weight: let w, armor: let a):
            return (weight: w.rawValue * 2, armor: a.rawValue * 4)
        
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let five = ArithmeticExpression.number(5)
        let four = ArithmeticExpression.number(4)
        
        let sum = ArithmeticExpression.addition(five, four)
        let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
        
        // (5 + 4) * 2
        print(evaluate(product))
        
        let woodenHelmetProps = Wearable.Helmet(weight: .Light, armor: .Light).attributes()
        
        print(woodenHelmetProps)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func evaluate(_ expression: ArithmeticExpression) -> Int {
        switch expression {
        case let .number(value):
            return value
        case let .addition(left, right):
            return evaluate(left) + evaluate(right)
        case let .multiplication(left, right):
            return evaluate(left) * evaluate(right)
        }
    }

}

