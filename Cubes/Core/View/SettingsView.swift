//
//  SettingsView.swift
//  Cubes
//
//  Created by Ilya Schevchenko on 11.11.2024.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            Text("Colors")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .padding(.bottom, 100)
                .padding(.horizontal)
            
            VStack(spacing: 20) {
                HStack(spacing: 10) {
                    SettingsGameCellView(color: Color.red)
                    SettingsGameCellView(color: Color.gray)
                    SettingsGameCellView(color: Color.indigo)
                }
                
                HStack(spacing: 10) {
                    SettingsGameCellView(color: Color.yellow)
                    SettingsGameCellView(color: Color.green)
                    SettingsGameCellView(color: Color.pink)
                }
                
                HStack(spacing: 10) {
                    SettingsGameCellView(color: Color.purple)
                    SettingsGameCellView(color: Color.orange)
                    SettingsGameCellView(color: Color.cyan)
                }
                
                Spacer()
                
                Text("Confirm")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 44)
                    .foregroundStyle(.white)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
                    .shadow(color: Color(.systemBlue), radius: 3)
                    .padding()
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .foregroundStyle(Color.secondary)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

#Preview {
    SettingsView()
}
