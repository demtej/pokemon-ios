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
        NavigationView {
            List {
                ForEach(viewModel.pokemons) { pokeSpecies in
                    HStack {
                        Text(pokeSpecies.name.capitalizedFirstLetter())
                    }.onTapGesture {
                        viewModel.tapSpecies(pokeSpecies)
                    }
                }

                if !viewModel.isFullList {
                    Section {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .listRowInsets(EdgeInsets())
                            .background(Color.clear)
                            .onAppear {
                                Task {
                                    await viewModel.fetchPokemons()
                                }
                            }
                    }
                }
            }
            .padding(.bottom)
            .navigationTitle("POKEDEX")
        }
    }
}
