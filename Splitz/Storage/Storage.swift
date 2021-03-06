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
    
    var persistentContainer: PersistentContainer { get }
    var mainContext: ManagedContext { get }
    var taskContext: ManagedContext { get }
    
    func saveContext()
    func saveContext(_ context: ManagedContext)
    
    init()
    
}
