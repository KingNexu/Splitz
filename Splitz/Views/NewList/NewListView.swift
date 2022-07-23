//
//  NewListView.swift
//  Splitz
//
//  Created by Julian Schmid on 30.06.22.
//

import SwiftUI

struct NewListView: View {
    
    @StateObject private var viewModel: NewViewViewModel
    
    init() {
        self._viewModel = StateObject(wrappedValue: NewViewViewModel())
    }
    
    var body: some View {
        VStack{
            GroupBox {
                TextField("Title", text: $viewModel.billCaption)
                    .textInputAutocapitalization(.sentences)
                    .textFieldStyle(NewTextFieldStyle(bgColor: Color.white, fontSize: 30, cornerRadius: 12))
                    .padding()
            }
            .padding()
            GroupBox {
                VStack(alignment: .center){
                    Text("With how many people do you share your bill?")
                        .frame(width:250)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 22, weight: .bold, design: .default))
                    HStack{
                        Button(action: {
                            if viewModel.usersCount > 1{
                                viewModel.usersCount -= 1
                            }
                        }, label: {
                            Image(systemName: "minus")
                                .font(.system(size: 45, weight: .bold, design: .default))
                                .foregroundColor(.black)
                        })
                        Image(systemName: "person.fill")
                            .font(.system(size: 45, weight: .bold, design: .default))
                        Text(String(viewModel.usersCount))
                            .font(.system(size: 45, weight: .bold, design: .default))
                        Button(action: {
                            if viewModel.usersCount < 10 {
                                viewModel.usersCount += 1
                            }
                        }, label: {
                            Image(systemName: "plus")
                                .font(.system(size: 45, weight: .bold, design: .default))
                                .foregroundColor(.black)
                        })
                    }
                    .padding(.vertical, 5)
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            Spacer()
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                Button(action: {
                    viewModel.addBill()
                }, label: {
                    Text("Create")
                        .font(.system(size: 17, weight: .semibold, design: .default))
                })
                .buttonStyle(CreateButtonStyle(bgGradient: LinearGradient.navigationBarGradient, fgColor: .black))
                .cornerRadius(8)
            Spacer()
        }
        .navigationTitle("New List")
        .navigationBarTitleDisplayMode(.large)
        .safeAreaInset(edge: .top, content: {
            Capsule()
                .frame(width: UIScreen.main.bounds.width * 0.3, height: 5)
            .foregroundColor(.gray)
            .padding(.top)
        })
    }
}

struct NewListView_Previews: PreviewProvider {
    static var previews: some View {
        NewListView()
    }
}
