//
//  String+Linter.swift
//  Pokedex
//
//  Created by Demian Tejo on 15/05/2023.
//

import Foundation

extension String {
    func capitalizedFirstLetter() -> String {
        guard let firstLetter = self.first else {
            return self
        }
        return String(firstLetter).capitalized + String(self.dropFirst())
    }
}
