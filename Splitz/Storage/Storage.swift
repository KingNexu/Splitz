//
//  Storage.swift
//  Splitz
//
//  Created by Julian Schmid on 07.07.22.
//

import Foundation
import CoreData


public protocol Storage {
    
    associatedtype PersistentContainer
    associatedtype ManagedContext
    
    //var persistentContainer: PersistanceContainer { get }
    var mainContext: ManagedContext { get }
    //
    func saveContext()
    
    init()
    
}
