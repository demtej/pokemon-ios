//
//  AppCoordinator.swift
//  Pokedex
//
//  Created by Demian Tejo on 14/05/2023.
//

import UIKit


final class AppCoordinator {

    private let baseNavController = UINavigationController()

    // MARK: Data Sources
    private let speciesDataSource = SpeciesService()
    private let chainDataSource = ChainService()

    func start() -> UIViewController {

        // onboarding if needed
        // login if needed
        let homeViewController = HomeScreen(viewModel: HomeViewModel(appCoordinator: self, speciesDataSource: speciesDataSource)).viewController()
        homeViewController.navigationItem.backButtonTitle = ""
        baseNavController.pushViewController(homeViewController, animated: false)
        return baseNavController
    }

    // MARK: Screens
    enum Screen {
        case home
        case detail(species: Species)
    }

    // MARK: Navigation
    func navigate(to screen: Screen, animated: Bool = true) {
        switch screen {
        case .home:
            baseNavController.popToRootViewController(animated: animated)
        case .detail(let species):
            let viewModel = DetailViewModel(species: species, appCoordinator: self, chainDataSource: chainDataSource)
            let viewController = DetailScreen(viewModel: viewModel).viewController()
            viewController.navigationItem.backButtonTitle = ""
            baseNavController.pushViewController(viewController, animated: animated)
        }
    }

}
