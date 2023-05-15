//
//  ErrorView.swift
//  Pokedex
//
//  Created by Demian Tejo on 15/05/2023.
//

import SwiftUI

struct ErrorView: View {
    let error: Error
    let retryAction: () -> Void

    var body: some View {
        VStack {
            Text("Error: \(error.localizedDescription)")
                .font(.headline)
                .foregroundColor(.red)
                .padding()

            Button(action: retryAction) {
                Text("Retry")
                    .font(.headline)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}
