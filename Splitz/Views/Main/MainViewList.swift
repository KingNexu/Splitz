//
//  MainViewList.swift
//  Splitz
//
//  Created by Julian Schmid on 28.06.22.
//

import SwiftUI

struct MainViewList: View {
    
    var billsData: [Bill]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false, content: {
                MainViewListItem(name: "")
                    .padding()
                    .opacity(0)
                ForEach(billsData ,id: \.id){item in
                    NavigationLink(destination: DetailView(bill: item), label: MainViewListItem(name: item.caption))
                    
                }
            })
            .padding(.horizontal)
        }
    }
}

struct MainViewList_Previews: PreviewProvider {
    static var previews: some View {
        MainViewList(billsData: [Bill(id: UUID(), caption: "Michi", users: []),Bill(id: UUID(), caption: "Max", users: [])])
    }
}
