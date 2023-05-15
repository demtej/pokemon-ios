//
//  PokemonApiResponse.swift
//  Pokedex
//
//  Created by Demian Tejo on 14/05/2023.
//

import Foundation

// MARK: - PokeAPIResponse
struct PokeAPIResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Species]
}

