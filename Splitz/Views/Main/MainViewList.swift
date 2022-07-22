//
//  MainViewList.swift
//  Splitz
//
//  Created by Julian Schmid on 28.06.22.
//

import SwiftUI

struct MainViewList: View {
    
    @StateObject private var viewModel: MainViewListViewModel
    
    init() {
        //because of @MainActor in ViewModel class
        self._viewModel = StateObject(wrappedValue: MainViewListViewModel())
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            MainViewListItem(name: "")
                .padding()
                .opacity(0)
            ForEach(viewModel.billsData ,id: \.id){item in
                MainViewListItem(name: item.caption)
            }
        })
            .padding(.horizontal)
            .onAppear {
                viewModel.getAllBills()
            }
    }
}

struct MainViewList_Previews: PreviewProvider {
    static var previews: some View {
        MainViewList()
    }
}
