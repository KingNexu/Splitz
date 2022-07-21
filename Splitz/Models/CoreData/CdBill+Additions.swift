//
//  CdBill.swift
//  Splitz
//
//  Created by Julian Schmid on 11.07.22.
//

import Foundation

extension CdBill {
    
    func encode(entity: Bill) {
        self.id = entity.id
        self.caption = entity.caption
    }
    
    func decode() -> Bill {
        return Bill(cdBill: self)
    }
}
