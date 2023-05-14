//
//  SpeciesAdapter.swift
//  Pokedex
//
//  Created by Demian Tejo on 14/05/2023.
//

import Foundation

struct SpeciesAdapter {

    private let IMAGE_BASE_URL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/{species_id}.png"

    let name: String
    let url: String

    private var pokemonId: String {
        if let url = URL(string: url) {
            let lastPathComponent = url.lastPathComponent
            return lastPathComponent
        }
        return ""
    }

    var imageUrlString: String {
        IMAGE_BASE_URL.replacingOccurrences(of: "{species_id}", with: pokemonId)
    }

    init(species: Species) {
        self.name = species.name
        self.url = species.url
    }
}
