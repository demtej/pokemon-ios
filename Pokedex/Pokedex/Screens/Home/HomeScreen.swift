//
//  HomeScreen.swift
//  Pokedex
//
//  Created by Demian Tejo on 14/05/2023.
//

import SwiftUI

struct HomeScreen: View, ViewControllable {

    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        List {
            ForEach(viewModel.pokemons) { pokeSpecies in
                HStack {
                    Text(pokeSpecies.name)
                    Spacer()
                    Text(pokeSpecies.pokemonId)
                }

            }

            if !viewModel.isFullList {
                ProgressView()
                    .foregroundColor(.red)
                    .progressViewStyle(CircularProgressViewStyle())
                    .onAppear {
                        Task {
                            await viewModel.fetchPokemons()
                        }
                    }
            }
        }
        .navigationTitle("POKEDEX")

    }
}
