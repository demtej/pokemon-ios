//
//  AppDelegate.swift
//  Pokedex
//
//  Created by Demian Tejo on 14/05/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    internal var window: UIWindow?
    private let appCoordinator = AppCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = appCoordinator.start()
        window?.makeKeyAndVisible()
        return true
    }

}

