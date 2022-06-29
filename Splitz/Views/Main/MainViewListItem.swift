//
//  MainViewListItem.swift
//  Splitz
//
//  Created by Julian Schmid on 26.06.22.
//

import SwiftUI

struct MainViewListItem: View {
    var body: some View {
        HStack(alignment: .center) {
            //Icon
            Image(systemName: "doc.plaintext.fill")
                .font(.system(size: 25))
                .padding()
            VStack(alignment: .leading) {
                Text("List Name")
                    .font(.system(size: 25, weight: .regular, design: .default))
                Text("Date")
                    .font(.system(size: 15, weight: .ultraLight, design: .default))
            }
            Spacer()
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(18)
        
    }
}

struct MainViewListItem_Previews: PreviewProvider {
    static var previews: some View {
        MainViewListItem()
    }
}
