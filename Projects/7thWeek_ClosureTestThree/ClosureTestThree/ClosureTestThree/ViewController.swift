//
//  ViewController.swift
//  ClosureTestThree
//
//  Created by 정교윤 on 2017. 6. 26..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        startPrintOne(5)
//        
//        let startPoint: (Int) -> Void = { (lineNumb:Int) in
//            
//            for i in 1...lineNumb {
//                var str: String = ""
//                for _ in 1...i {
//                    str += "*"
//                }
//                print(str)
//                
//            }
//        
//        
//        }
//        
//        startPoint(5)
        
        let intNumArray = [1,2,3,4,5]
        
        let strNumArray:([Int]) -> [String] = {(number:[Int]) -> [String] in
            
            var strResultArray:[String] = []
            
            for i in number {
                strResultArray.append(String(i))
            }
            
            return strResultArray
            
        }
        
        print(strNumArray(intNumArray))
        
        let evenNumberArray:([Int]) -> [Int] = {(number:[Int]) -> [Int] in
        
            var evenNumberArray:[Int] = []
            
            for i in number {
                if i % 2 == 0 {
                    evenNumberArray.append(i)
                }
            }
            
            return evenNumberArray
        
        
        }
        
        print(evenNumberArray(intNumArray))
        
        
        let digitNames = [1,2,3,4,5]
        
        //let strList = digitNames.map({"\($0)"})

        //let strList = digitNames.map {"\($0)"}
        
        // map
        // Array 안의 값이 Int에서 String으로 변환되는데 그 안에서 *의 개수로 표현이 된다. 
        // 리턴값은 array이다.
        let starList = digitNames.map { (number) -> String in
            var star = ""
            
            for _ in 0..<number {
                star += "*"
            }
            
            return star
        }
        
        print(starList)
        
        // filter
        
        let evenNumbers = digitNames.filter {$0 % 2 == 0}
        
        print(evenNumbers)
        
        let evenStarList = evenNumbers.map { (number) -> String in
            var star = ""
            
            for _ in 0..<number {
                star += "*"
            }
            
            return star
        }
        
        print(evenStarList)
        
        let oddNumbers = digitNames.filter {$0 % 2 != 0}
        
        print(oddNumbers)
        
        let oddStarList = oddNumbers.map { (number) -> String in
            var star = ""
            
            for _ in 0..<number {
                star += "*"
            }
            
            return star
        }
        
        print(oddStarList)
        
        // reduce
        
        let digitNamesArray = 1...10 // 1,2,3,4,5,6,7,8,9,10
        
        // reduce(0) -> 초기값이 0
        // num1 = 0 / num2 = 1 <- num1 에 초기값이 0이 들어감
        // num1 = 1 / num2 = 2
        // num1 = 3 / num2 = 3
        // num1 = 6 / num2 = 4 
        // num1 = 10 / num2 = 5
        // num1 = 15 / num2 = 6
        // ...
        // num1 = 45 / num2 = 10
        let allSum = digitNamesArray.reduce(0) { (num1, num2) -> Int in
            num1 + num2
        }
        
        print(allSum)
        
        // 구구단 구하기
        let gugudan = {(number:Int) -> [Int] in
        
            var result:[Int] = []
            
            for i in 1...9 {
                result.append(number * i)
            }
            
            return result
            
        }
        
        print(gugudan(3))
        
        // factorial 구하기
        let getFactorial = {(number:Int) -> Int in
        
            var result:Int = 1
            
            for i in 1...number {
                result *= i
            }
        
            return result
        }
        
        print(getFactorial(4))
        
        let numberArray = 1...5
        
        let factorialforAllNum = numberArray.reduce(1) { (num1, num2) -> Int in
            num1 * num2
        }
        
        print(factorialforAllNum)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // *
    // ** 
    // ***
    // ****
    // *****
    func startPrintOne(_ lines:Int) {
        
        let printValue = {(name:String) in print(name) }
        
        
        for i in 1...lines {
            var str = ""
            for _ in 1...i {
                
                str += "*"
                
            }
            printValue(str)
            //printValue("/n")
            str = ""
        }
        
    }
    
    func startPrintTwo(_ lines:Int) {
        
        // 3 => 5 / 4 => 7 
        // (lines * 2) - 1
        
        //   *
        //  ***
        // *****
        
        //    *   
        //   ***
        //  *****
        // *******
        
        let maximumCharacters = (lines * 2) - 1
        
        
        
    }



}

