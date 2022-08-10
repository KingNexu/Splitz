//
//  DetailView.swift
//  Splitz
//
//  Created by Julian Schmid on 10.08.22.
//

import SwiftUI

struct DetailView: View {
    
    var bill: Bill
    
    var body: some View {
        VStack{
            Text(bill.caption)
            Text(bill.id.uuidString)
                .font(.caption)
            List(bill.users, id: \.id) { item in
                Text(item.name)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(bill: Bill(id: UUID(), caption: "Caption", users: []))
    }
}
