//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Demian Tejo on 14/05/2023.
//

import Foundation


final class HomeViewModel: ObservableObject {

    // MARK: Private Properties
    private var lastResponse: PokeAPIResponse? = nil
    private let service: SpeciesService
    private let appCoordinator: AppCoordinator

    // MARK: Published Properties
    @Published var pokemons: [Species] = []
    @Published var error: Error? = nil

    // MARK: Text Strings
    struct Texts {
        static let title = "POKEDEX"
    }

    // MARK: Init
    init(appCoordinator: AppCoordinator, service: SpeciesService = SpeciesService()) {
        self.appCoordinator = appCoordinator
        self.service = service
    }

    // MARK: Public Properties & Methods
    var isFullList: Bool {
        if lastResponse == nil {
            return false
        }
        return lastResponse?.next == nil
    }

    @MainActor
    func fetchPokemons() async {
        do {
            self.error = nil
            lastResponse = try await service.getSpecies(whenPreviousIs: lastResponse)
            await MainActor.run {
                pokemons.append(contentsOf: lastResponse?.results ?? [])
            }
        } catch let error {
            await MainActor.run {
                self.error = error
            }
        }
    }

    func tapSpecies(_ species: Species) {
        self.appCoordinator.navigate(to: .detail(species: species))
    }

}
