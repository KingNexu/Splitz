//
//  Injector.swift
//  Splitz
//
//  Created by Julian Schmid on 22.07.22.
//

import Foundation

struct Injector {
    
    static func getBillRepository() -> BillRepository {
        return BillRepository(dao: BillDao())
    }
    
    static func getUserRepository() -> UserRepository {
        return UserRepository(dao: UserDao())
    }
    
    
}
