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
    
    func deleteBill(indexSet: IndexSet) {
        Task.init {
            let index = indexSet[indexSet.startIndex]
            
            do {
                let bill = self.billsData[index]
                try await billRepository.deleteBill(id: bill.id)
            } catch {
                //TODO: Throw correct error
                print(error.localizedDescription)
                return
            }
            
                billsData.remove(at: index)
        }
    }
}
