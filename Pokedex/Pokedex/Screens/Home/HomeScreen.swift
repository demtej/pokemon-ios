//
//  HomeScreen.swift
//  Pokedex
//
//  Created by Demian Tejo on 14/05/2023.
//

import SwiftUI

struct HomeScreen: View, ViewControllable {
    var body: some View {
        VStack {
            Text("Hello, World!")
            Text("POKEDEX")
        }

    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
