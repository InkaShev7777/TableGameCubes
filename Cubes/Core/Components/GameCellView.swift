//
//  GameCellView.swift
//  Cubes
//
//  Created by Ilya Schevchenko on 22.08.2024.
//

import SwiftUI

struct GameCellView: View {
    
    let character: String
    var body: some View {
        LazyVStack {
            Text("\(character.uppercased())")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .fontWeight(.bold)
        }
        .frame(width: 100, height: 100)
        .background(Color(.systemPink))
        .cornerRadius(8)
        .shadow(color: .black, radius: 15)
    }
}

#Preview {
    GameCellView(character: "a")
}
