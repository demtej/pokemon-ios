//
//  ChainItemView.swift
//  Pokedex
//
//  Created by Demian Tejo on 15/05/2023.
//

import SwiftUI

struct ChainItemView: View {

    let species: SpeciesAdapter
    var highlighted: Bool = false

    var body: some View {
        VStack {
            RemoteImageView(imageUrl: species.imageUrlString)
                .frame(width: 80, height: 80)
                .fixedSize()
                .background(highlighted ? Color.green.opacity(0.3) : Color.gray.opacity(0.3))
                .cornerRadius(10)
            Text(species.name.capitalizedFirstLetter())
        }
        .padding()
        .background(highlighted ? Color.green.opacity(0.2) : Color.gray.opacity(0.2) )
        .cornerRadius(10)
    }
}
