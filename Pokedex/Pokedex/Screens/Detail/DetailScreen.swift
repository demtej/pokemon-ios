//
//  DetailScreen.swift
//  Pokedex
//
//  Created by Demian Tejo on 14/05/2023.
//

import SwiftUI

struct DetailScreen: View, ViewControllable {

    @ObservedObject var viewModel: DetailViewModel
    typealias Texts = DetailViewModel.Texts
    let IMAGE_SIZE : CGFloat = 100

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    RemoteImageView(imageUrl: viewModel.imageUrl)
                        .frame(width: IMAGE_SIZE, height: IMAGE_SIZE)
                        .fixedSize()
                    Text(viewModel.species.name.capitalizedFirstLetter())
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                .background(Color.purple)
                Spacer()
                VStack {
                    Text(Texts.evolutionChainTitle)
                        .font(.title2)
                        .fontWeight(.bold)
                    VStack {
                        ForEach(viewModel.speciesInChain) { species in
                            ChainItemView(species: species, highlighted: species == viewModel.species)
                                .scaleEffect(species == viewModel.species ? 1 : 0.8)
                                .onTapGesture {
                                    if species != viewModel.species {
                                        withAnimation {
                                            viewModel.tapSpecies(species.species)
                                        }
                                    }
                                }
                        }
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
                Spacer()
            }
            .background(Color.purple.opacity(0.2))
        }
        .onAppear {
            Task {
                await viewModel.fetchEvolutionChain()
            }
        }
    }
}
