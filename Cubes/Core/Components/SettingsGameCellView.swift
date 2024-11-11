//
//  SettingsGameCellView.swift
//  Cubes
//
//  Created by Ilya Schevchenko on 11.11.2024.
//

import SwiftUI

struct SettingsGameCellView: View {
    @State private var isPressed = false
    var color: Color
    var body: some View {
        VStack {
            GameCellView(character: "a", selectedColor: color)
                .scaleEffect(isPressed ? 1.2 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0), value: isPressed)
                .onTapGesture {
                    isPressed = true
                    GameViewViewModel.shared.setSelectedColor(color: color)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        isPressed = false
                    }
                }
        }
    }
}

#Preview {
    SettingsGameCellView(color: Color.gray)
}
