//
//  ContentView.swift
//  Splitz
//
//  Created by Julian Schmid on 21.06.22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        //TODO: Implement Header
        VStack {
            MainViewNavigationBar()
        }
        .alignmentGuide(VerticalAlignment.top) {_ in 1}
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewInterfaceOrientation(.portrait)
    }
}
