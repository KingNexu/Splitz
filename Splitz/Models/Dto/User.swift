//
//  User.swift
//  Splitz
//
//  Created by Julian Schmid on 11.07.22.
//

import Foundation

struct User: Storable {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
    
    init(cdUser: CdUser) {
        self.id = cdUser.id!
        self.name = cdUser.name!
    }
}
