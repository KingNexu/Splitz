//
//  NewListView.swift
//  Splitz
//
//  Created by Julian Schmid on 30.06.22.
//

import SwiftUI

struct NewListView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var viewModel: NewViewViewModel
    
    init() {
        self._viewModel = StateObject(wrappedValue: NewViewViewModel())
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading){
                Text(LocalizedString.new_bill)
                    .font(.system(size: 35, weight: .heavy, design: .default))
                    .padding([.top, .leading, .trailing], 17.0)
            }
            VStack (){
                GroupBox {
                    TextField(LocalizedString.title, text: $viewModel.billCaption)
                        .textInputAutocapitalization(.sentences)
                        .textFieldStyle(NewTextFieldStyle(bgColor: Color.white, fontSize: 30, cornerRadius: 12))
                        .padding()
                        .onChange(of: viewModel.billCaption, perform: {_ in
                            viewModel.checkIsTextFieldEmpty()
                        })
                }
                .padding(.bottom)
                .padding(.horizontal)
                
                GroupBox {
                    VStack(alignment: .center){
                        Text(LocalizedString.with_how_many_people_do_you_share_your_bill)
                            .fixedSize(horizontal: false, vertical: true)
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
                .padding(.horizontal)
                Spacer()
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    Button(action: {
                        viewModel.addBill()
                        viewModel.sheetPresented.toggle()
                    }, label: {
                        Text(LocalizedString.create)
                            .font(.system(size: 17, weight: .semibold, design: .default))
                    })
                    .disabled(viewModel.isTextFieldEmpty)
                    .buttonStyle(CreateButtonStyle(bgGradient: viewModel.isTextFieldEmpty ? LinearGradient.buttonDisabledGradient : LinearGradient.navigationBarGradient, fgColor: viewModel.isTextFieldEmpty ? .white : .black))
                    .cornerRadius(8)
                Spacer()
            }
            .onChange(of: viewModel.sheetPresented) { newValue in
                if newValue {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
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
