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
    
}
