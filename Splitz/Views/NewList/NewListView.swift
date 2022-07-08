//
//  NewListView.swift
//  Splitz
//
//  Created by Julian Schmid on 30.06.22.
//

import SwiftUI

struct NewListView: View {
    @State var name = ""
    @State private var personCount: Int = 3
    
    var body: some View {
        VStack{
            GroupBox {
                TextField("Text", text: $name)
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
                            if personCount > 1{
                                personCount -= 1
                            }
                        }, label: {
                            Image(systemName: "minus")
                                .font(.system(size: 45, weight: .bold, design: .default))
                                .foregroundColor(.black)
                        })
                        Image(systemName: "person.fill")
                            .font(.system(size: 45, weight: .bold, design: .default))
                        Text(String(personCount))
                            .font(.system(size: 45, weight: .bold, design: .default))
                        Button(action: {
                            if personCount < 10 {
                                personCount += 1
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
                Button(action: {}, label: {
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
