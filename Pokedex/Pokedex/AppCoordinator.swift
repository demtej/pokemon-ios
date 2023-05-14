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
        let homeViewController = HomeScreen(viewModel: HomeViewModel()).viewController()
        baseNavController.pushViewController(homeViewController, animated: false)
        return baseNavController
    }
}
