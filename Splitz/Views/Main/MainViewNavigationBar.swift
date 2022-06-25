//
//  MainViewNavigationBar.swift
//  Splitz
//
//  Created by Julian Schmid on 25.06.22.
//

import SwiftUI

struct MainViewNavigationBar: View {
    var body: some View {
        HStack(alignment: .center){
            Button(action: {}, label: {
                Image(systemName: "gearshape.fill")
                    .font(.system(size: 30))
                    .foregroundColor(Color.text.logo)
            })
            Spacer()
            Text("Splitz")
                .font(.system(size: 35, weight: .bold, design: .default))
            Button(action: {}, label: {
                Image(systemName: "gearshape.fill")
                    .foregroundColor(Color.background.navigationBar)
                    .font(.system(size: 30))
            })
            Spacer()
        }
        .padding()
        .padding(.top, 50)
        .headerShape(background: Color.background.navigationBar, radius: 35)
    }
}

struct MainViewNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        MainViewNavigationBar()
    }
}
