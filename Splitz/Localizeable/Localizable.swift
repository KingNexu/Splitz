//
//  Localizable.swift
//  Splitz
//
//  Created by Julian Schmid on 27.07.22.
//

import Foundation

@propertyWrapper
/// Property Wrapper for generating NSLocalizedStrings
///
///  Makes it easier to implement NSLocalized Strings for Localization
///  Usage:
///  struct LocalizedStrings {
///     @Localizable static var nameOfLocalization = "LocalizedString"
///  }
///
 struct Localizable {
    var wrappedValue: String {
        didSet { wrappedValue = NSLocalizedString(wrappedValue, comment: "") }
    }

    init(wrappedValue: String) {
        self.wrappedValue = NSLocalizedString(wrappedValue, comment: "")
    }
 }
