//
//  SpeciesAdapter.swift
//  Pokedex
//
//  Created by Demian Tejo on 14/05/2023.
//

import Foundation

struct SpeciesAdapter: Identifiable {

    private let IMAGE_BASE_URL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/{species_id}.png"

    let species: Species

    var name: String {
        species.name
    }
    
    var url: String {
        species.url
    }

    var id: String {
        species.id
    }

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
        self.species = species
    }
}


extension SpeciesAdapter : Equatable{

    static func == (lhs: SpeciesAdapter, rhs: SpeciesAdapter) -> Bool {
        lhs.id == rhs.id
    }
    
}
