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
    
    /// Gets a Bill based of the Id
    /// - Parameter id: Unice Identifier of one Bill
    /// - Returns: Returns a Swift Bill
    func getBill(id: UUID) async throws -> Bill {
        return try await dao.getBill(billId: id)
    }
    
}
