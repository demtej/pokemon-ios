//
//  DetailViewModel.swift
//  Pokedex
//
//  Created by Demian Tejo on 14/05/2023.
//

import Foundation

final class DetailViewModel: ObservableObject {

    // MARK: Private Properties
    private let appCoordinator: AppCoordinator
    private let chainService: ChainService

    // MARK: Published Properties
    @Published var species: SpeciesAdapter
    @Published var chain: Chain? = nil
    @Published var error: Error? = nil

    // MARK: Texts
    struct Texts {
        static let evolutionChainTitle = "Evolution Chain"
    }

    // MARK: Init
    init(species: Species,appCoordinator: AppCoordinator, chainService: ChainService = ChainService()) {
        self.species = SpeciesAdapter(species: species)
        self.appCoordinator = appCoordinator
        self.chainService = chainService
    }


    // MARK: Public Properties & Methods
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
