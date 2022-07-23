//
//  NewViewViewModel.swift
//  Splitz
//
//  Created by Julian Schmid on 22.07.22.
//

import Foundation

final class NewViewViewModel: ViewModel {
    
    private let billRepository: BillRepository
    //private let userRepository: UserRepository
    
    @Published var billsData: [Bill] = []
    
    @Published var billCaption: String
    @Published var usersCount: Int
    
    required init (
        billRepository: BillRepository = Injector.getBillRepository(),
        billCaption: String = "",
        usersCount: Int = 3
    ) {
        self.billRepository = billRepository
        self.billCaption = billCaption
        self.usersCount = usersCount
    }
    
    func addBill() {
        Task {
            //TODO: Add ViewStatus
            
            //Create Bill
            let bill = Bill(
                id: UUID(),
                caption: billCaption,
                users: []
            )
            
            //Store Data
            do {
                //insert Bill
                try await _ =  billRepository.insert(bill: bill)
            } catch {
                return
            }
            
            //TODO: Dismiss Sheet
            
        }
    }
    
}
