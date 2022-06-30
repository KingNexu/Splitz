//
//  Gradient.swift.swift
//  Splitz
//
//  Created by Julian Schmid on 30.06.22.
//

import Foundation
import SwiftUI

extension LinearGradient{
    static var navigationBarGradient = LinearGradient(colors: [Color.background.navigationBarGradientStart, Color.background.navigationBarGradientEnd], startPoint: .leading, endPoint: .topTrailing)
}
