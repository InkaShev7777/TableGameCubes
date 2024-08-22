//
//  ContentView.swift
//  Cubes
//
//  Created by Ilya Schevchenko on 22.08.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 30) {
                Text("Cubes Game")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                NavigationLink(destination: GameView(listCharacters: ["a"])) {
                    Text("Start")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 44)
                        .foregroundStyle(.white)
                        .background(Color(.systemBlue))
                        .cornerRadius(8)
                }
            }
            .padding()
            .background {
                Image("background-black")
        }
        }
    }
}

#Preview {
    ContentView()
}
