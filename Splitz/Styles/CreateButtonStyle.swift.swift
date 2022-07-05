//
//  CreateButtonStyle.swift.swift
//  Splitz
//
//  Created by Julian Schmid on 30.06.22.
//

import Foundation
import SwiftUI


struct CreateButtonStyle: ButtonStyle {
    var bgGradient: LinearGradient
    var fgColor: Color
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .multilineTextAlignment(.center)
            .lineLimit(1)
            .frame(width: UIScreen.width * 0.90, height: 50, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .foregroundColor(fgColor)
            .background(bgGradient)
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .opacity(configuration.isPressed ? 0.6 : 1)
    }
}
