//
//  UserDao.swift
//  Splitz
//
//  Created by Julian Schmid on 11.07.22.
//

import Foundation

import CoreData

class UserDao: Dao<User, CdUser> {
    
    //Get By UID
    
    func getByUid(userId: UUID) async throws -> User? {
        let cdUser: CdUser? = try await getByUid(userId: userId)
        return cdUser.map { $0.decode() }
    }
    
    private func getByUid(userId: UUID) async throws -> CdUser? {

        let backgroundContext = storage.taskContext
        
        let cdUser: CdUser? = try await fetchObject(backgroundContext: backgroundContext, predicates: [NSPredicate(format: "id = %@", userId.uuidString)])
        
        return cdUser

    }
}
