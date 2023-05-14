//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Demian Tejo on 14/05/2023.
//

import Foundation


class HomeViewModel: ObservableObject {

    @Published var pokemons: [String] = []

    func fetchPokemons() async {
        sleep(2)
        await MainActor.run {
            pokemons = ["P1","Poke 2", "Pokemon 3", "4"]
        }
    }

}
