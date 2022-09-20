//
//  UserDao.swift
//  Splitz
//
//  Created by Julian Schmid on 11.07.22.
//

import Foundation
import CoreData

class UserDao: Dao<User, CdUser> {
    
    // Get By UID
    
    func userGetAll() async throws -> [User] {
        return try await getAll().map { $0.decode()}
    }
    
    func getByUid(userId: UUID) async throws -> User? {
        let cdUser: CdUser? = try await getByUid(userId: userId)
        return cdUser.map { $0.decode() }
    }
    
    private func getByUid(userId: UUID) async throws -> CdUser? {

        let backgroundContext = storage.taskContext
        let cdUser: CdUser? = try await fetchObject(backgroundContext: backgroundContext, predicates: [NSPredicate(format: "%K = %@", (\CdUser.id)._kvcKeyPathString!, userId.uuidString)])
        
        return cdUser

    }
    
    func insertOrUpdate(_ user: User) async throws -> User {
        let backgroundContext: NSManagedObjectContext = storage.taskContext
        let cdUser: CdUser
        
        let fetchedUser: CdUser? = try await fetchObject(backgroundContext: backgroundContext, predicates: [NSPredicate(format: "%K = %@", (\CdUser.id)._kvcKeyPathString!, user.id.uuidString)])
        
        if fetchedUser != nil {
            cdUser = fetchedUser!
        } else {
            cdUser = CdUser(context: backgroundContext)
        }
        cdUser.encode(entity: user)
        
        self.storage.saveContext(backgroundContext)
        return user
    }
}
