//
//  UIScreen.swift
//  Splitz
//
//  Created by Julian Schmid on 24.06.22.
//

import Foundation
import SwiftUI


extension UIScreen {
    static var width: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    static var height: CGFloat {
        return UIScreen.main.bounds.size.height
    }
}
