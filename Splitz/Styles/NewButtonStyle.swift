//
//  NewButtonStyle.swift
//  Splitz
//
//  Created by Julian Schmid on 29.06.22.
//

import Foundation
import SwiftUI

struct NewItemButtonStyle: ButtonStyle {
    var bgGradient: LinearGradient
    var fgColor: Color
    var size: CGFloat
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration
            .label
            .multilineTextAlignment(.center)
            .lineLimit(1)
            .foregroundColor(fgColor)
            .frame(width: size, height: size, alignment: .center)
            .background(bgGradient)
            .clipShape(Circle())
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .opacity(configuration.isPressed ? 0.6 : 1)
    }
    
}

