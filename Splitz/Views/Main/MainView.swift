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
            ZStack{
                VStack {
                    Spacer()
                    MainViewList()
                }
                Spacer()
                VStack {
                    MainViewNavigationBar()
                    Spacer()
                }
            }
        }
        .background(.gray)
        .ignoresSafeArea(.all, edges: .vertical)
        
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewInterfaceOrientation(.portrait)
    }
}
