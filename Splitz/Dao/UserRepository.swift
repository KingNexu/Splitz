//
//  UserRepository.swift
//  Splitz
//
//  Created by Julian Schmid on 11.07.22.
//

import Foundation


class UserRepository: Repository {
    
    private var dao: UserDao
    
    init(dao: UserDao) {
        self.dao = dao
    }
    
    func getAll() async throws -> [User] {
        return try await dao.userGetAll()
    }
    
    func getByUid(_ id: UUID) async throws -> User? {
        return try await dao.getByUid(userId: id)
    }
    
    func insertOrUpdate(_ user: User) async throws -> User {
        return try await dao.insertOrUpdate(user)
    }
    
}
