//
//  CdUser+Additions.swift
//  Splitz
//
//  Created by Julian Schmid on 11.07.22.
//

import Foundation

extension CdUser {
    
    //Mapping
    func encode(entity: User) {
        self.id = entity.id
        self.name = entity.name
    }
    func decode() -> User {
        return User(cdUser: self)
    }
}
