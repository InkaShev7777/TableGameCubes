//
//  Generator.swift
//  Cubes
//
//  Created by Ilya Schevchenko on 22.08.2024.
//

import Foundation

class Generator: ObservableObject {
    private let russianAlphabet = Array("абвгдеёжзийклмнопрстуфхцчшщэюя")
    
    private var randomLetters: [Character] = []
    
    func generateRandomRussianLetters() -> [Character] {
        randomLetters = []
        for _ in 1...8 {
                if let randomLetter = russianAlphabet.randomElement() {
                    randomLetters.append(randomLetter)
                }
            }
        
        randomLetters.append(" ")

            return randomLetters
    }
}
