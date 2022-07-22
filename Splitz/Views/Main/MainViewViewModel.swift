//
//  MainViewViewModel.swift
//  Splitz
//
//  Created by Julian Schmid on 12.07.22.
//

import Foundation

final class MainViewViewModel: ViewModel {

    private let billRepository: BillRepository

    required init (
        billRepository: BillRepository = Injector.getBillRepository()
    ) {
        self.billRepository = billRepository
    }
    
    func getAllBills() async throws -> [Bill]{
        do {
            return try await billRepository.getAll()
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func deleteBill(id: UUID) async throws {
        do {
            try await billRepository.deleteBill(id: id)
        } catch {
            print(error.localizedDescription)
        }
    }
    

}
