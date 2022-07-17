//
//  BillDao.swift
//  Splitz
//
//  Created by Julian Schmid on 11.07.22.
//

import Foundation


class BillDao: Dao<Bill, CdBill> {
    
    func billsGetAll() async throws -> [Bill] {
        return try await getAll().map { $0.decode() }
    }
    
    func deleteBill(id: UUID) async throws {
        try await delete(predicates: [NSPredicate(format: "id = %@", id.uuidString)])
    }
    
}
