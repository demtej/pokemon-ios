//
//  EvolutionChain.swift
//  Pokedex
//
//  Created by Demian Tejo on 14/05/2023.
//

import Foundation

// MARK: - EvolutionChain
struct EvolutionChain: Codable {
    let chain: Chain
    let id: Int
}

// MARK: - Chain
struct Chain: Codable {
    
    let species: Species
    let evolvesTo: [Chain]

    enum CodingKeys: String, CodingKey {
        case evolvesTo = "evolves_to"
        case species
    }
}


