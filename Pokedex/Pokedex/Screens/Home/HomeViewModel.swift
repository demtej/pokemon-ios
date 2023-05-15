//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Demian Tejo on 14/05/2023.
//

import Foundation


final class HomeViewModel: ObservableObject {

    private var lastResponse: PokeAPIResponse? = nil
    private let service = SpeciesService()
    private let appCoordinator: AppCoordinator

    @Published var pokemons: [Species] = []
    @Published var error: Error? = nil

    struct Texts {
        static let title = "POKEDEX"
    }
    
    var isFullList: Bool {
        if lastResponse == nil {
            return false
        }
        return lastResponse?.next == nil
    }

    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
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
