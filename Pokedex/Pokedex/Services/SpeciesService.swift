//
//  SpeciesService.swift
//  Pokedex
//
//  Created by Demian Tejo on 14/05/2023.
//

import Foundation


final class PokedexApi {
    static let BASE_URL = "https://pokeapi.co/api/v2/"

    enum ApiError: Error {
        case malformedUrl
        case unkwonError
    }
}


final class SpeciesService {

    private static let MAX_RESULTS = 20
    private static let URI = "pokemon-species?limit={max_result}"
    private static let BASE_URL = "\(PokedexApi.BASE_URL)/\(URI.replacingOccurrences(of: "{max_result}", with: "\(MAX_RESULTS)"))"

    func getSpecies(whenPreviousIs prevResponse: PokeAPIResponse? = nil) async throws -> PokeAPIResponse? {
        if let prevResponse = prevResponse {
            return try await getNextSpecies(of: prevResponse)
        } else {
            return try await getFirstSpecies()
        }
    }

    func getNextSpecies(of prevResponse: PokeAPIResponse) async throws -> PokeAPIResponse? {
        guard let urlString = prevResponse.next else {
            return nil
        }
        guard let url = URL(string: urlString) else {
            throw PokedexApi.ApiError.malformedUrl
        }
        return try await getSpecies(from: url)
    }

    func getFirstSpecies() async throws -> PokeAPIResponse {
        guard let url = URL(string: SpeciesService.BASE_URL) else {
            throw PokedexApi.ApiError.malformedUrl
        }
        return try await getSpecies(from: url)
    }

    func getSpecies(from url:URL)  async throws -> PokeAPIResponse {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw PokedexApi.ApiError.unkwonError
        }
        let pokeResponse = try JSONDecoder().decode(PokeAPIResponse.self, from: data)
        return pokeResponse
    }
}
