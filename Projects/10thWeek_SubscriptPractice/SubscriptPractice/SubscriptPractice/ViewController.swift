//
//  ViewController.swift
//  SubscriptPractice
//
//  Created by 정교윤 on 2017. 7. 11..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows:Int, columns:Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns) // 0.0 | 0.0 | 0.0 | 0.0
        
    }
    
    subscript(row:Int, column:Int) -> Double {
        
        get {
            return grid[(row * columns) + column]
        }
        set {
            grid[(row * columns) + column] = newValue
        }
        
    }
    
    func printAllData() {
        
        for row in 0..<columns {
            var line = ""
            
            for col in 0..<rows {
                let value = self[row,col]
                line += "|\(value)|"
            }
            print(line)
            
        }
        
    }
}

extension Double {
    
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
    
}

struct IntStack {
    var items = [Int]()
    
    mutating func push(_ item:Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

// generic stack : Last In First Out
struct Stack<T> {
    var items = [T]()
    
    mutating func push(_ item:T) {
        items.append(item)
    }
    
    mutating func pop() -> T {
        return items.removeLast()
    }
}

// generic queue: First In First Out
struct Queue<T> {
    var items = [T]()
    
    mutating func enqueue(_ item:T) {
        items.append(item)
    }
    
    mutating func dequeue() -> T {
        return items.removeFirst()
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var matrix = Matrix(rows: 2, columns: 2)
        
        print(matrix)
        
        matrix[0,0] = 1
        matrix[0,1] = 2.5
        matrix[1,0] = 2
        matrix[1,1] = 5
        
        
        
        print(matrix)
        
        print(matrix.grid)
        
        var matrix2 = Matrix(rows: 3, columns: 3)
        
        matrix2[0,0] = 1
        matrix2[0,1] = 1.5
        matrix2[0,2] = 1.8
        matrix2[1,0] = 2
        matrix2[1,1] = 2.5
        matrix2[1,2] = 2.8
        matrix2[2,0] = 3
        matrix2[2,1] = 3.5
        matrix2[2,2] = 3.8
        
        print(matrix2)
        
        matrix2.printAllData()
        
        let oneInch = 25.4.mm
        print("One inch is \(oneInch) meters")
        
        let threeFeet = 3.ft
        print("Three feet is \(threeFeet) meters")
        
        // Generic
        var someInt = 3
        var anotherInt = 107
        swapTwoValues(&someInt, &anotherInt)
        
        print(someInt, anotherInt)
        
        
        var stack = Stack.init(items: [1,2,3])
        
        print(stack)
        
        stack.push(4)
        
        print(stack)
        
        let stack2 = stack.pop()
        
        print(stack2)
        print(stack)
        
        print("-----------------")
        
        var queue = Queue.init(items: [1,2,3])
        
        print(queue)
        
        queue.enqueue(4)
        
        print(queue)
        
        print(queue.dequeue())
        
        print(queue)
        
        var array: [Int] = [1,2,3,1]
        
        print(array.index(of: 1) ?? "none") // 1인 인덱스 0
        
        
        
        array.remove(at: array.index(of: 1)!)
        
        print(array)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 사용자가 정의한 타입을 의미하는 이름이 T 이다.
    func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
        let temporaryA = a
        a = b
        b = temporaryA
        
    }
    
    


}

