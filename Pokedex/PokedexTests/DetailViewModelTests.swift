//
//  DetailViewModelTests.swift
//  PokedexTests
//
//  Created by Demian Tejo on 15/05/2023.
//

import XCTest
@testable import Pokedex

class DetailViewModelTests: XCTestCase {

    var viewModel: DetailViewModel!
    var appCoordinatorMock: AppCoordinator!

    override func setUp() {
        super.setUp()
        appCoordinatorMock = AppCoordinator()
        let species = Species(name: "Pikachu", url: "https://pokeapi.co/api/v2/pokemon/25")
        viewModel = DetailViewModel(species: species, appCoordinator: appCoordinatorMock)
    }

    override func tearDown() {
        viewModel = nil
        appCoordinatorMock = nil

        super.tearDown()
    }

    func testSpeciesInChain_SingleSpecies() {
        // Given
        let chain = Chain(species: Species(name: "Pikachu", url: "https://pokeapi.co/api/v2/pokemon/25"), evolvesTo: [])
        viewModel.chain = chain

        // When
        let result = viewModel.speciesInChain

        // Then
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.species.name, "Pikachu")
    }

    func testSpeciesInChain_MultipleSpecies() {
        // Given
        let chain = Chain(species: Species(name: "Bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1"), evolvesTo: [
            Chain(species: Species(name: "Ivysaur", url: "https://pokeapi.co/api/v2/pokemon/2"), evolvesTo: [
                Chain(species: Species(name: "Venusaur", url: "https://pokeapi.co/api/v2/pokemon/3"), evolvesTo: [])
            ])
        ])

        viewModel.chain = chain

        // When
        let result = viewModel.speciesInChain

        // Then
        XCTAssertEqual(result.count, 3)
        XCTAssertEqual(result[0].species.name, "Bulbasaur")
        XCTAssertEqual(result[1].species.name, "Ivysaur")
        XCTAssertEqual(result[2].species.name, "Venusaur")
    }


}

