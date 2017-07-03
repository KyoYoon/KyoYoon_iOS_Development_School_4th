//
//  Person+CoreDataProperties.swift
//  CoreDataSample
//
//  Created by 정교윤 on 2017. 6. 28..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import Foundation
import CoreData

public class Person: NSManagedObject {
    
}

extension Person {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }
    
    @NSManaged public var name: String?
    @NSManaged public var age: Int32
    
}
