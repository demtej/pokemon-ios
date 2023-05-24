//
//  ChainService.swift
//  Pokedex
//
//  Created by Demian Tejo on 14/05/2023.
//

import Foundation

protocol ChainDataSource {
    func getEvolutionChain(species: Species) async throws -> EvolutionChain
}

final class ChainService: ChainDataSource {

    // MARK: Public Functions
    func getEvolutionChain(species: Species) async throws -> EvolutionChain {
        let chainUrl = try await getChainUrl(species: species)
        guard let url = URL(string: chainUrl) else {
            throw PokedexApi.ApiError.malformedUrl
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw PokedexApi.ApiError.unkwonError
        }
        let chain = try JSONDecoder().decode(EvolutionChain.self, from: data)
        return chain
    }

    // MARK: Private Functions
    private func getChainUrl(species: Species) async throws -> String {
        guard let url = URL(string: species.url) else {
            throw PokedexApi.ApiError.malformedUrl
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw PokedexApi.ApiError.unkwonError
        }
        let pokemonApi = try JSONDecoder().decode(PokemonApi.self, from: data)
        return pokemonApi.evolutionChain.url
    }
}
