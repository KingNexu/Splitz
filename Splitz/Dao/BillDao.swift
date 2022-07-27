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
        try await delete(predicates: [NSPredicate(format: "%K == %@", (\CdBill.id)._kvcKeyPathString!, billId.uuidString)])
    }
    
    func getBill(billId: UUID) async throws -> Bill {
        let backgroundContext = storage.taskContext
        
        //TODO: KeyString 
        let cdBill: CdBill = try await fetchObject(backgroundContext: backgroundContext, predicates: [NSPredicate(format: " %K == %@", (\CdBill.id)._kvcKeyPathString!, billId.uuidString)]) as! CdBill
        
        return cdBill.decode()
        
    }
    
    func insertOrUpdat(_ bill: Bill) async throws -> Bill {
        
        let backgroundContext = storage.taskContext
        
        let cdBill: CdBill
        
        let fetchedBill: CdBill? = try await fetchObject(backgroundContext: backgroundContext, predicates: [NSPredicate(format: "%K = %@", (\CdBill.id)._kvcKeyPathString! ,bill.id.uuidString)]) as! CdBill?
        
        if fetchedBill != nil {
            cdBill = fetchedBill!
        } else {
            cdBill = CdBill(context: backgroundContext)
        }
        
        cdBill.encode(entity: bill)
        
        self.storage.saveContext(backgroundContext)
        
        return bill
    }
    
    func insert(bill: Bill) async throws -> Bill{
        
        let backgroundContext = storage.taskContext
        
        let cdBill: CdBill = CdBill(context: backgroundContext)
        cdBill.encode(entity: bill)
        
        //TODO: Add Relationship
        
        self.storage.saveContext(backgroundContext)
        
        return cdBill.decode()
    }
}
