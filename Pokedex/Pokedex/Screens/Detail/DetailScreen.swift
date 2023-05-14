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
        RemoteImageView(imageUrl: viewModel.imageUrl)
    }
}
