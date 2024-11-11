//
//  GameView.swift
//  Cubes
//
//  Created by Ilya Schevchenko on 22.08.2024.
//

import SwiftUI

struct GameView: View {
    @StateObject var generator = GeneratorCharacters()
    @StateObject private var timeManager = TimeManager()
    
    @State var listCharacters: [Character]
    
    @Environment(\.dismiss) var dismiss
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        VStack {
            // grid of characters(cubes)
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(0 ... listCharacters.count-1, id: \.self) { index in
                    GameCellView(character: "\(listCharacters[index])", selectedColor: GameViewViewModel.shared.selectedColor)
                        .padding()
                }
            }
            .padding()
            
            // time info
            Text("\(timeManager.timeString())")
                .foregroundStyle(.white)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
            
            // regenerat button
            Button {
                listCharacters = generator.generateRandomRussianLetters()
                timeManager.startTimer()
            } label: {
                Text("Regenerate")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .frame(width: 330, height: 44)
                    .foregroundStyle(.white)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .foregroundStyle(Color.white)
                    .onTapGesture {
                        dismiss()
                    }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: SettingsView()) {
                    Image(systemName: "gear")
                        .imageScale(.large)
                        .foregroundStyle(Color.white)
                }
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

//#Preview {
//    GameView(listCharacters: ["a"])
//}
