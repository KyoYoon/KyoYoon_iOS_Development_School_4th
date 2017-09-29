//
//  ViewController.swift
//  SortingPractice
//
//  Created by 정교윤 on 2017. 7. 25..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func quickSort(array: [Int]) -> [Int] {
        
        if array.count == 0 || array.count == 1 {
            return array
        }
        else if array.count == 2 {
            
            if array[0] > array[1] {
                return [array[1],array[0]]
            }
            else {
                return array
            }

            
        }
        else {
            
            var sortingArray = array
            let pivot = sortingArray.remove(at: 0)
            
            var smallArray: [Int] = []
            var bigArray: [Int] = []
            
            for item in sortingArray {
                if item < pivot {
                    smallArray.append(item)
                    
                } else {
                    bigArray.append(item)
                }
            }
            
            return array
        }
        
        
    }


}

