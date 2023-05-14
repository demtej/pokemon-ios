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
            ForEach(viewModel.pokemons, id: \.self) { pokename in
                Text(pokename)
            }
        }
        .navigationTitle("POKEDEX")
        .onAppear {
            Task {
                await viewModel.fetchPokemons()
            }
        }

    }
}
