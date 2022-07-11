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
    
    init(cdBill: CdBill) {
        self.id = cdBill.id!
        self.caption = cdBill.caption!
    }
    
}
