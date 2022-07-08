//
//  NewTextFieldStyle.swift.swift
//  Splitz
//
//  Created by Julian Schmid on 07.07.22.
//

import Foundation
import SwiftUI

struct NewTextFieldStyle: TextFieldStyle {
    var bgColor: Color
    var fontSize: CGFloat
    var cornerRadius: CGFloat
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding()
            .background(bgColor)
            .font(.system(size: fontSize, weight: .heavy, design: .rounded))
            .multilineTextAlignment(.center)
            .cornerRadius(cornerRadius)
    }
}
