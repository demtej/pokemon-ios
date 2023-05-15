//
//  RemoteImage.swift
//  Pokedex
//
//  Created by Demian Tejo on 14/05/2023.
//

import SwiftUI

struct RemoteImageView: View {
    let imageUrl: String

    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            case .failure( _):
                Image(systemName: "photo.circle")
                    .resizable()
            @unknown default:
                fatalError()
            }
        }
    }
}
