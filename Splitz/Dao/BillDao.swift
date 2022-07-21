//
//  BillDao.swift
//  Splitz
//
//  Created by Julian Schmid on 11.07.22.
//

import Foundation
import CoreData


class BillDao: Dao<Bill, CdBill> {
    
    func billsGetAll() async throws -> [Bill] {
        return try await getAll().map { $0.decode() }
    }
    
    func deleteBill(billId: UUID) async throws {
        try await delete(predicates: [NSPredicate(format: "id = %@", billId.uuidString)])
    }
    
    func getBill(billId: UUID) async throws -> Bill {
        let backgroundContext = storage.taskContext
        
        //TODO: KeyString 
        let cdBill: CdBill = try await fetchObject(backgroundContext: backgroundContext, predicates: [NSPredicate(format: "id = %@", billId.uuidString)]) as! CdBill
        
        return cdBill.decode()
        
    }
}
