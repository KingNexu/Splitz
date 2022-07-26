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
    
    var body: some View {
        //TODO: Implement Header
        VStack(alignment: .trailing) {
            ZStack{
                VStack {
                    Spacer()
                    MainViewList(billsData: viewModel.billsData)
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
                //Ignore for LongPress
                
            }, label: {
                Image(systemName: "plus")
                    .font(.system(size: 35))
            })
            .simultaneousGesture(LongPressGesture(minimumDuration: 0.3).onEnded({_ in
                //
            }))
            .simultaneousGesture(TapGesture().onEnded({
                viewModel.sheetPresented = true
            }))
            .sheet(isPresented: $viewModel.sheetPresented, onDismiss: {
                    viewModel.getAllBills()
                }, content: {
                    NewListView()
                })
                .buttonStyle(NewItemButtonStyle(bgGradient: LinearGradient.navigationBarGradient, fgColor: Color.black, size: 70))
                .padding(.vertical, 35)
                .padding(.horizontal)
        })
        .background(.thickMaterial)
        .ignoresSafeArea(.all, edges: .vertical)
        .onAppear(perform: {
            viewModel.getAllBills()
        })
        
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewInterfaceOrientation(.portrait)
    }
}
