//
//  CoreDataStorage.swift
//  Splitz
//
//  Created by Julian Schmid on 07.07.22.
//

import Foundation
import CoreData
import UIKit

struct CoreDataStorage: Storage {
    
    typealias PersistentContainer = NSPersistentContainer
    typealias ManagedContext = NSManagedObjectContext
    
    static let shared = CoreDataStorage()
    
    let persistentContainer: NSPersistentContainer
    
    //View Context
    var mainContext: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    //INIT
    init(){
        persistentContainer = NSPersistentContainer(name: "Splitz_Datamodel")
        
        persistentContainer.loadPersistentStores { desciption , error in
            if let error = error {
                fatalError("Unsolfed error\(error.localizedDescription)")
            }
        }
    }
    
    func saveContext() {
        let context = mainContext
        
        context.performAndWait {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unsolved error \(nserror.localizedDescription)")
            }
            context.reset()
        }
    }
    
    
}
