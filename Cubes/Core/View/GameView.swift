//
//  GameView.swift
//  Cubes
//
//  Created by Ilya Schevchenko on 22.08.2024.
//

import SwiftUI

struct GameView: View {
    @StateObject var generator = Generator()
    @StateObject private var timeManager = TimeManager()
    
    @State var listCharacters: [Character]
    
    let items = Array(1...9).map { "Item \($0)" }
    
    //    init() {
    //    }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0 ... listCharacters.count-1, id: \.self) { item in
                        GameCellView(character: "\(listCharacters[item].uppercased())")
                            .padding()
                    }
                }
                .padding()
                
                Text("\(timeManager.timeString())")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding()
            }
            
            Button {
                listCharacters = generator.generateRandomRussianLetters()
                timeManager.startTimer()
            } label: {
                Text("Regenerate")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 44)
                    .foregroundStyle(.white)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }
        }
        .onAppear {
            timeManager.startTimer()
            listCharacters = generator.generateRandomRussianLetters()
        }
        .background {
            Image("background-black")
        }
    }
}

#Preview {
    GameView(listCharacters: ["a"])
}
