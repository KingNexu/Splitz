//
//  List+CoreDataProperties.swift
//  Splitz
//
//  Created by Julian Schmid on 08.07.22.
//

import Foundation
import CoreData


extension Bill {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bill> {
        return NSFetchRequest<Bill>(entityName: "Bill")
    }
    
    @NSManaged public var caption: String?
    @NSManaged public var id: UUID?
    
}


