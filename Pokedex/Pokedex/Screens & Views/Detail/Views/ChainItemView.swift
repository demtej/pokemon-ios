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
    let IMAGE_SIZE : CGFloat = 80

    var body: some View {
        VStack {
            RemoteImageView(imageUrl: species.imageUrlString)
                .frame(width: IMAGE_SIZE, height: IMAGE_SIZE)
                .fixedSize()
                .background(highlighted ? Color.highlightedColor : Color.pokeGrayLight)
                .cornerRadius(CGFloat.defaultRadius)
            Text(species.name.capitalizedFirstLetter())
        }
        .padding()
        .background(highlighted ? Color.lightHighlightedColor : Color.pokeGrayUltralight )
        .cornerRadius(CGFloat.defaultRadius)
    }
}
