//
//  PokemonApi.swift
//  Pokedex
//
//  Created by Demian Tejo on 14/05/2023.
//

import Foundation

// MARK: - PokemonApi
struct PokemonApi: Codable {

    let evolutionChain: EvolutionChainURL
    let name: String

    enum CodingKeys: String, CodingKey {
        case evolutionChain = "evolution_chain"
        case name
    }
}

// MARK: - EvolutionChain
struct EvolutionChainURL: Codable {
    let url: String
}
