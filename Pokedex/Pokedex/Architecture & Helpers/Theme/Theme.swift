//
//  Theme.swift
//  Pokedex
//
//  Created by Demian Tejo on 15/05/2023.
//

import UIKit
import SwiftUI

// MARK: UIKit Colors
extension UIColor {
    static let accentColor = UIColor(named: "AccentColor")
    static let errorColor = UIColor(named: "ErrorColor")
    static let highlightedColor = UIColor(named: "Highlight")
    static let pokeGray = UIColor(named: "PokeGray")
}

// MARK: Colors
extension Color {
    static let accentColor = Color(UIColor.accentColor ?? .purple)
    static let errorColor = Color(UIColor.errorColor ?? .red)

    static let lightBackground = accentColor.opacity(0.4)
    static let ultraLightBackground = accentColor.opacity(0.2)

    static let highlightedColor = Color(UIColor.highlightedColor ?? .green)
    static let lightHighlightedColor = highlightedColor.opacity(0.2)

    static let pokeGray = Color(UIColor.pokeGray ?? .purple)
    static let pokeGrayLight = pokeGray.opacity(0.4)
    static let pokeGrayUltralight = pokeGray.opacity(0.2)
}

// MARK: Default Values
extension CGFloat {
    static let defaultRadius = 10.0
}
