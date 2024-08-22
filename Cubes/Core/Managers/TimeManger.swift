//
//  TimeManger.swift
//  Cubes
//
//  Created by Ilya Schevchenko on 22.08.2024.
//

import Foundation
import AVFoundation

class TimeManager: ObservableObject {
    
    @Published var timeRemaining: Int = 120
    
    private var timer: Timer?
    private var player: AVAudioPlayer?

    func startTimer() {
        timer?.invalidate()
        timeRemaining = 120

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.timerTick()
        }
    }

    private func timerTick() {
        if timeRemaining > 0 {
            timeRemaining -= 1
        } else {
            timer?.invalidate()
            playSound()
        }
    }

    private func playSound() {
        if let soundURL = Bundle.main.url(forResource: "alert", withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: soundURL)
                player?.play()
            } catch {
                print("Ошибка воспроизведения звука: \(error.localizedDescription)")
            }
        }
    }

    func timeString() -> String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
