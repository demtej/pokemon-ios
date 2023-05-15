//
//  PokedexApi.swift
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
