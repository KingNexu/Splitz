//
//  MainViewList.swift
//  Splitz
//
//  Created by Julian Schmid on 28.06.22.
//

import SwiftUI

struct MainViewList: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            MainViewListItem()
                .padding()
                .opacity(0)
            ForEach(0...20, id: \.self){_ in
                MainViewListItem()
            }
        })
            .padding(.horizontal)
    }
}

struct MainViewList_Previews: PreviewProvider {
    static var previews: some View {
        MainViewList()
    }
}
