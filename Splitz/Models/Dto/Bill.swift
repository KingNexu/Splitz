//
//  Bill.swift
//  Splitz
//
//  Created by Julian Schmid on 11.07.22.
//

import Foundation

struct Bill: Storable {
    
    var id: UUID
    var caption: String
    var users: [User]
    
    init(id: UUID, caption: String, users: [User]) {
        self.id = id
        self.caption = caption
        self.users = users
    }
    
    init(cdBill: CdBill) {
        self.id = cdBill.id!
        self.caption = cdBill.caption!
        self.users = (cdBill.users?.allObjects as! [CdUser]).map { User(cdUser: $0)}
    }
    
}
