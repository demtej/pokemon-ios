//
//  ViewControllable.swift
//  Pokedex
//
//  Created by Demian Tejo on 14/05/2023.
//

import SwiftUI
import UIKit

// MARK: ViewController
protocol ViewControllable {
    func viewController() -> UIViewController

}
extension ViewControllable where Self: View {
    func viewController() -> UIViewController {
        return UIHostingController(rootView: self)
    }
}
