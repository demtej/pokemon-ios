//
//  DetailViewModel.swift
//  Pokedex
//
//  Created by Demian Tejo on 14/05/2023.
//

import Foundation

final class DetailViewModel: ObservableObject {

    private let appCoordinator: AppCoordinator
    let species: SpeciesAdapter
    private let chainService = ChainService()
    
    @Published var chain: Chain? = nil
    @Published var error: Error? = nil

    var speciesInChain : [SpeciesAdapter] {
        var speciesAdapters = [SpeciesAdapter]()
        var chain = chain
        while let nextInChain = chain {
            speciesAdapters.append(SpeciesAdapter(species: nextInChain.species))
            chain = chain?.evolvesTo.first
        }
        return speciesAdapters
    }

    var imageUrl: String {
        species.imageUrlString
    }

    init(species: Species,appCoordinator: AppCoordinator ) {
        self.species = SpeciesAdapter(species: species)
        self.appCoordinator = appCoordinator
    }


    @MainActor
    func fetchEvolutionChain() async {
        do {
            let chain = try await chainService.getEvolutionChain(species: self.species.species)
            await MainActor.run {
                self.chain = chain.chain
            }
        } catch let error {
            await MainActor.run {
                self.error = error
            }
        }

    }

}
