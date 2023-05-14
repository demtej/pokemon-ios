//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Demian Tejo on 14/05/2023.
//

import Foundation


class HomeViewModel: ObservableObject {

    private var lastResponse: PokeAPIResponse? = nil
    private let service = SpeciesService()
    @Published var pokemons: [Species] = []
    @Published var error: Error? = nil

    @MainActor
    func fetchPokemons() async {
        do {
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

    var isFullList: Bool {
        if lastResponse == nil {
            return false
        }
        return lastResponse?.next == nil
    }
}
