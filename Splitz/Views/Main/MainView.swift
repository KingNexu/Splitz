//
//  ContentView.swift
//  Splitz
//
//  Created by Julian Schmid on 21.06.22.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel: MainViewListViewModel
    
    init() {
        //because of @MainActor in ViewModel class
        self._viewModel = StateObject(wrappedValue: MainViewListViewModel())
    }
    
    
    @State var showSheet = false
    
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
            Button(action: {
                //Show sheet
                showSheet = true
            }, label: {
                Image(systemName: "plus")
                    .font(.system(size: 35))
            })
                .sheet(isPresented: $showSheet, onDismiss: {
                    
                }, content: {
                    NewListView()
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
