//
//  Species.swift
//  Pokedex
//
//  Created by Demian Tejo on 14/05/2023.
//

import Foundation

// MARK: - Species
struct Species: Codable, Identifiable {
    var id: String {
        return name
    }
    let name: String
    let url: String

    var pokemonId: String {
        if let url = URL(string: url) {
            let lastPathComponent = url.lastPathComponent
            return lastPathComponent
        }

        return ""
    }
}


