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
        VStack {
            RemoteImageView(imageUrl: viewModel.imageUrl)
                .fixedSize()
            Spacer()
            HStack {
                ForEach(viewModel.speciesInChain) { species in
                    RemoteImageView(imageUrl: species.imageUrlString)
                        .fixedSize()
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchEvolutionChain()
            }
        }

    }
}
