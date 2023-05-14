//
//  DetailViewModel.swift
//  Pokedex
//
//  Created by Demian Tejo on 14/05/2023.
//

import Foundation

final class DetailViewModel: ObservableObject {

    private let appCoordinator: AppCoordinator
    let species: SpeciesAdapter

    var imageUrl: String {
        species.imageUrlString
    }

    init(species: Species,appCoordinator: AppCoordinator) {
        self.species = SpeciesAdapter(species: species)
        self.appCoordinator = appCoordinator
    }

}
