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
    @Published var sheetPresented: Bool = false
    @Published var isTextFieldEmpty: Bool
    
    required init (
        billRepository: BillRepository = Injector.getBillRepository(),
        billCaption: String = "",
        usersCount: Int = 3,
        isTextFieldEmpty: Bool = true
    ) {
        self.billRepository = billRepository
        self.billCaption = billCaption
        self.usersCount = usersCount
        self.isTextFieldEmpty = isTextFieldEmpty
    }
    
    func addBill() {
        Task {
            //TODO: Add ViewStatus
            
            //Create Bill
            let bill = Bill(
                id: UUID(),
                caption: billCaption,
                users: [User(id: UUID(), name: "jss"),User(id: UUID(), name: "mjs")]
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
    
    func checkIsTextFieldEmpty() -> Void{
        Task.init {
            isTextFieldEmpty = billCaption.isEmpty
        }
    }
    
}
