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
}
