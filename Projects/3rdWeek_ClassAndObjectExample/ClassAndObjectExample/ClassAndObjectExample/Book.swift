//
//  Book.swift
//  ClassAndObjectExample
//
//  Created by 정교윤 on 2017. 5. 24..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import Foundation

struct Book {
    var name:String
    var cost:Int
    var isbn:UInt
    
    mutating func addIsbn() {
        self.isbn = isbn + UInt(cost)
    }
}

struct Subject {
    var name:String?
    var age:Int?
    var gender:Bool
    
    init(gender:Bool) {
        self.gender = gender // custom initializer => 이렇게 선언하면 memberwise initializer 는 쓰지 못한다.
        
    }
}

class BookStore {
    var books:[Book] = []
    var name:String = ""
    var address:String = ""
    
    init(name:String, address:String) {
        self.name = name
        self.address = address
    }
    
    func addBook(name:String, cost:Int) {
        
        let book:Book = Book(name: "스위프트 따라잡기", cost: 1000000, isbn: UInt(books.count + 1)) // memberwise initializer
        
        self.books.append(book)
        
    }
    
    deinit {
        print("deinit")
        
    }
    
    
}

class Student {
    
    var subjects:[Subject] = []
    
    func addSubject(name:String) {
        var sub1:Subject = Subject(gender: true) // custom initializer 사용
        sub1.name = "joo"
        sub1.age = 30
        subjects.append(sub1)
    }
}
