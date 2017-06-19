//
//  ViewController.swift
//  ErrorProcessingTest
//
//  Created by 정교윤 on 2017. 6. 16..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let vendingMachine = VendingMachine()
        vendingMachine.coinsDeposited = 8
        
        do {
            try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
        } catch VendingMachineError.invalidSelection {
            print("Invalid Selection.")
        } catch VendingMachineError.outOfStock {
            print("Out of Stock.")
        } catch VendingMachineError.insufficientFunds( _)
        {
            print("Out of Stock.")

        } catch { // 위의 에러를 제외한 모든 에러인 경우
            print ("나머지 에러!!")
        }
        
        
        // converting errors to optional value
        let x = try? someThrowingFunction() // optional type 
        
        let z = try! someThrowingFunction() // 무조건 optional type이 아니다.
        
        let y: Int?
        
        do {
            y = try someThrowingFunction()
        } catch {
            y = nil
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
        let snackName = favoriteSnacks[person] ?? "Candy Bar"
        try vendingMachine.vend(itemNamed: snackName)
    }
    
    func someThrowingFunction() throws -> Int {
        
        return 0
        
    }
    
    // Specifiying Cleanup Actions (후처리)
//    func processFil(filename:String) throws {
//        
//        if filename != nil {
//            let file = open(filename)
//            defer {
//                close(file)
//            }
//            
//            while let line = try file.readline() {
//                
//            }
//        }
    //    close(file) is called here, at the end of the scope 
//        
//    }


}

