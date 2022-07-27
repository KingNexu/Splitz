//
//  Dao.swift
//  Splitz
//
//  Created by Julian Schmid on 11.07.22.
//

import Foundation
import CoreData

protocol Storable {
    var id: UUID { get set }
}

class Dao<EntityType: Storable, ManagedObjectType: NSManagedObject> {
    
    private (set) var storage: CoreDataStorage
    
    required init(storage: CoreDataStorage = CoreDataStorage.shared) {
        self.storage = storage
    }
    
    internal func fetchObject<T: NSManagedObject>(backgroundContext: CoreDataStorage.ManagedContext, predicates: [NSPredicate]) async throws -> T? {
        
        let objects: [T] = try await fetchObjects(backgroundContext: backgroundContext, predicates: predicates)
        
        return objects.first
        
    }
    
    internal func fetchObjects<T: NSManagedObject>(backgroundContext: CoreDataStorage.ManagedContext, predicates: [NSPredicate], sorts: [NSSortDescriptor]? = nil) async throws -> [T] {
        
        let request = T.fetchRequest() as! NSFetchRequest<T>
        request.sortDescriptors = sorts
        
        if predicates.isEmpty {
        } else if predicates.count == 1  {
            request.predicate = predicates[0]
        } else {
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
        }

        var results: [T]!
        await backgroundContext.perform {
            results = try? backgroundContext.fetch(request)
        }
        
        return results
    }
    
    func getAll() async throws -> [ManagedObjectType] {
        
        let backgroundContext = storage.taskContext
        
        let fetchedObjects: [ManagedObjectType] = try await fetchObjects(backgroundContext: backgroundContext, predicates: [])
        
        return fetchedObjects
        
    }
    
    func delete(predicates: [NSPredicate]) async throws {
        let backgroundContext = storage.taskContext
        
        let fetchedObjects: [ManagedObjectType] = try await fetchObjects(backgroundContext: backgroundContext, predicates: predicates)
        
        //TODO: Rollback?
        await backgroundContext.perform {
            fetchedObjects.forEach { entity in
                backgroundContext.delete(entity)
            }
            self.storage.saveContext(backgroundContext)
        }
    }
}
