//
//  DetailScreen.swift
//  Pokedex
//
//  Created by Demian Tejo on 14/05/2023.
//

import SwiftUI

struct DetailScreen: View, ViewControllable {

    @ObservedObject var viewModel: DetailViewModel

    var body: some View {
        NavigationView {
            VStack {
                RemoteImageView(imageUrl: viewModel.imageUrl)
                    .frame(width: 100, height: 100)
                    .fixedSize()
                Spacer()
                HStack {
                    ForEach(viewModel.speciesInChain) { species in
                        RemoteImageView(imageUrl: species.imageUrlString)
                            .frame(width: 100, height: 100)
                            .fixedSize()
                    }
                }
            }
            .navigationTitle(viewModel.species.name.capitalizedFirstLetter())
        }
        .onAppear {
            Task {
                await viewModel.fetchEvolutionChain()
            }
        }

    }
}
