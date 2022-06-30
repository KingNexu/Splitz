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
        VStack(alignment: .trailing) {
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
        .overlay(alignment: .bottomTrailing, content: {
            Button(action: {}, label: {
                Image(systemName: "plus")
                    .font(.system(size: 35))
            })
                .buttonStyle(NewItemButtonStyle(bgGradient: LinearGradient.navigationBarGradient, fgColor: Color.black, size: 70))
                .padding(.vertical, 35)
                .padding(.horizontal)
        })
        .background(.thickMaterial)
        .ignoresSafeArea(.all, edges: .vertical)
        
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewInterfaceOrientation(.portrait)
    }
}
