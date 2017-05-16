//
//  ViewController.swift
//  ArrayExample
//
//  Created by 정교윤 on 2017. 5. 16..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Array 예제
        var list:[Int] = [1,2,3,4,5,6,7,8]
        //var index = list.startIndex
        
        //print("\(index)")
        
        print("Before append, insert, remove, removeLast")
        if !list.isEmpty {
            print("\(list[list.startIndex])")
            print(list)
            print("\(list.count)")
        }
        
        print("After append, insert, remove, removeLast")
        
        list.append(10)
        list.insert(11, at: 3)
        list.remove(at: 0)
        
        list.removeLast()
        
        if !list.isEmpty {
            print("\(list[list.startIndex])")
            print(list)
            print("\(list.count)")
        }
        
        // 배열간 더하기 
        let list2:[Int] = [3,4]
        let listt = list2 + list + list + list2
        
        print(listt)
        
        // Set 예제
        var oddDigits:Set = [1,3,5,7,9]
        let evenDigits:Set = [2,4,6,8]
        let primeDigits:Set = [2,3,5,7]
        
        print("------Set Example----")
        print(oddDigits)
        print(evenDigits)
        print(primeDigits)
        
        print()
        let intersection = oddDigits.intersection(evenDigits)
        print(intersection)
        
        let symmetricDifference = oddDigits.symmetricDifference(primeDigits)
        print(symmetricDifference)
        
        let union = oddDigits.union(evenDigits).sorted()
        print(union)
        
        oddDigits.subtract(primeDigits)
        let subtract = oddDigits.sorted()
        print(subtract)
        
        print()
        print("Dictionary Example")
        
        var airports:[String:String] = ["ICH":"인천공항", "CJU":"제주공항"]
        
        // 여기서 프린트를 했는데 왜 Optional 이 나왔을까..
        print("\(airports["ICH"])")
        print("\(airports["CJU"])")
        
        // 구구단 예제 - while 문 예제
        print()
        print("구구단 결과 - whiile loop")
        googoodan(9)

        // 구구단 예제 - for 문 예제
        print()
        print("구구단 결과 - for loop")
        googoodanforloop(8)
        
        
        // 팩토리얼
        print()
        print("팩토리얼 결과")
        factorial(4)
        print()
        
        // 로또 숫자 출력 => 최대 숫자 45, 숫자 6개 (중복된 번호 허용)
        print("로또 숫자 (중복 허용)")
        let lottoNumbers = findLottoArrayVersion()
        print(lottoNumbers)
        print()
        
        // 로또 숫자 출력 => 최대 숫자 45, 숫자 6개 (중복된 번호 허용)
        print("로또 숫자 (중복 안됨)")
        let lottoNumbers2 = findLottoArrayVersion2()
        print(lottoNumbers2)
        print()
        
        // 약수 구하기 ex) 12의 약수 1,2,3,4,6,12 
        let measures:[UInt] = getMeasure(12)
        print(measures)
        print()
        
        // 소수인지 판단하기 
        if isPrimeNumber(5) == true {
            print("파라메터가 소수입니다")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func googoodan(_ dan:Int) {
        var gob:Int = 1
        
        while gob < 10 {
            print("\(dan) * \(gob) = \(dan*gob)")
            gob += 1
        }
    }
    
    func googoodanforloop(_ dan:Int) {
        
        
        for index in 1...9 {
            print("\(dan) * \(index) = \(dan*index)")
            
        }
    }
    
    func factorial(_ numbers:Int)
    {
        var answer:Int = 1
        
        for number in 1...numbers {
            answer *= number
        }
    
        print("\(numbers)! = \(answer)")
    }
    
    func getRandomNumber() {
        var randomNum:UInt32 = arc4random_uniform(10)
        
        
    }
    
    // 로또 숫자 뽑기 (Array) => 중복 허용
    func findLottoArrayVersion() -> [UInt] {
        
        var lottoNumbers:[UInt] = []
        
        for _ in 1...6 {
            
            lottoNumbers.append(UInt(arc4random_uniform(45)))
        }
        
        
        return lottoNumbers.sorted()
        
    }
    
    // 로또 숫자 뽑기 (Array) => 중복 제거
    func findLottoArrayVersion2() -> [UInt] {
        
        var lottoNumbers:[UInt] = []
        
        while lottoNumbers.count < 6 {
            
            let randomNumber:UInt = UInt(arc4random_uniform(45))
            
            // 새로 생성된 번호가 기존의 배열에 추가된 번호가 아닌 번호라면 새롭게 element를 추가한다.
            if !lottoNumbers.contains(randomNumber) {
                lottoNumbers.append(randomNumber)
                
            }
            
            
        }
        
        
        return lottoNumbers.sorted()
        
    }
    
    
    // 로또 숫자 뽑기 (Set) 총 45개, 6개의 숫자
    func findLottoSetVersion() -> Set<UInt> {
        
        var lottoNumbers:Set<UInt> = []
        
        for _ in 1...6 {
            lottoNumbers.insert(UInt(arc4random_uniform(45)))
        }
        
        return lottoNumbers
        
    }
    
    // 약수 구하기 
    // 12 => 1, 2, 3, 4, 6, 12
    func getMeasure(_ num:UInt) -> [UInt] {
        
        var measures:[UInt] = []
        
        for index in 1...num {
            
            if num % index == 0 {
                measures.append(index)
            }
            
        }
        
        print("\(num)의 약수는 아래와 같습니다.")
        
        return measures
    }
    
    // 소수 구하기 
    func isPrimeNumber(_ num:UInt) -> Bool {
        var result:Bool = false
        
        var measures:[UInt] = []
        
        for index in 1...num {
            
            if num % index == 0 {
                measures.append(index)
            }
            
        }
        
        // 소수일 때만 result 값이 true
        if measures.count == 2 {
            print("\(num)은 소수입니다.")
            result = true
        } else {
            print("\(num)은 소수가 아닙니다.")
        }
        
        return result
    }

}

