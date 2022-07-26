//
//  MainViewListViewModel.swift
//  Splitz
//
//  Created by Julian Schmid on 12.07.22.
//

import Foundation

final class MainViewListViewModel: ViewModel {

    private let billRepository: BillRepository
    
    @Published var billsData: [Bill] = []
    @Published var sheetPresented: Bool = false
    
    required init (
        billRepository: BillRepository = Injector.getBillRepository()
    ) {
        self.billRepository = billRepository
    }
    
    func getAllBills(){
        Task.init {
            let billsData: [Bill]
            
            do {
                billsData = try await billRepository.getAll()
            } catch {
                print(error.localizedDescription)
                return
            }
            
            //TODO: View Status
            self.billsData = billsData
        }
    }
    
    func deleteBill(id: UUID) {
        Task.init {
            do {
                try await billRepository.deleteBill(id: id)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
