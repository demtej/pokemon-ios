//
//  DetailViewModel.swift
//  Pokedex
//
//  Created by Demian Tejo on 14/05/2023.
//

import Foundation

final class DetailViewModel: ObservableObject {

    private let appCoordinator: AppCoordinator
    private let chainService: ChainService

    @Published var species: SpeciesAdapter
    @Published var chain: Chain? = nil
    @Published var error: Error? = nil

    struct Texts {
        static let evolutionChainTitle = "Evolution Chain"
    }

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

    init(species: Species,appCoordinator: AppCoordinator, chainService: ChainService = ChainService()) {
        self.species = SpeciesAdapter(species: species)
        self.appCoordinator = appCoordinator
        self.chainService = chainService
    }


    @MainActor
    func fetchEvolutionChain() async {
        do {
            self.error = nil
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

    func tapSpecies(_ species: Species) {
        self.species = SpeciesAdapter(species: species)
        Task {
            await fetchEvolutionChain()
        }
    }

}
