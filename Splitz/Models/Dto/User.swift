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
    var bill: Bill
    
    init(id: UUID, name: String, bill: Bill) {
        self.id = id
        self.name = name
        self.bill = bill
    }
    
    init(cdUser: CdUser) {
        self.id = cdUser.id!
        self.name = cdUser.name!
        self.bill = cdUser.bill!.decode()
    }
}
