//
//  AppCoordinator.swift
//  Pokedex
//
//  Created by Demian Tejo on 14/05/2023.
//

import UIKit


final class AppCoordinator {

    private let baseNavController = UINavigationController()

    func start() -> UIViewController {
        let homeViewController = HomeScreen(viewModel: HomeViewModel(appCoordinator: self)).viewController()
        homeViewController.navigationItem.backButtonTitle = ""
        baseNavController.pushViewController(homeViewController, animated: false)
        return baseNavController
    }

    enum Screen {
        case home
        case detail(species: Species)
    }

    func navigate(to screen: Screen, animated: Bool = true) {
        switch screen {
        case .home:
            baseNavController.popToRootViewController(animated: animated)
        case .detail(let species):
            let viewModel = DetailViewModel(species: species, appCoordinator: self)
            let viewController = DetailScreen(viewModel: viewModel).viewController()
            baseNavController.pushViewController(viewController, animated: animated)
        }
    }

}
