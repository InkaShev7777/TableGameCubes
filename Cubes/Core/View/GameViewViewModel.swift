//
//  GameViewViewModel.swift
//  Cubes
//
//  Created by Ilya Schevchenko on 11.11.2024.
//

import Foundation
import SwiftUI

class GameViewViewModel: ObservableObject {
    @Published var selectedColor: Color
    
    static var shared = GameViewViewModel()
    
    init() {
        self.selectedColor = Color.blue
    }
    
    func setSelectedColor(color: Color) {
        selectedColor = color
        print("Color now: \(selectedColor). New Color: \(color)")
    }
}
