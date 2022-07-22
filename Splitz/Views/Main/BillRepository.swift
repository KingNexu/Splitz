//
//  BillRepository.swift
//  Splitz
//
//  Created by Julian Schmid on 12.07.22.
//

import Foundation

class BillRepository: Repository {
    
    private var dao: BillDao
    
    init(dao: BillDao) {
        self.dao = dao
    }
    
    func getAll() async throws -> [Bill] {
        return try await dao.billsGetAll()
    }
    
    func deleteBill(id: UUID) async throws {
        try await dao.deleteBill(billId: id)
    }
    
    func getBill(id: UUID) async throws -> Bill {
        return try await dao.getBill(billId: id)
    }
   
    func insertOrUpdate(bill: Bill) async throws -> Bill {
        return try await dao.insertOrUpdat(bill)
    }
    
    func insert(bill: Bill) async throws -> Bill {
        return try await dao.insert(bill: bill)
    }
}
