//
//  GlobalAudioManager.swift
//  CapoEduca
//
//  Created by Silvana Rodrigues Alves on 29/02/24.
//

import Foundation
import AVFoundation

class GlobalAudioManager {
    static let shared = GlobalAudioManager()
    var audioPlayer: AVAudioPlayer?

    func setupAndStartAudio(fileName: String, fileType: String) {
        guard let soundURL = Bundle.main.url(forResource: fileName, withExtension: fileType) else {
            print("File not found.")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.play()
        } catch {
            print("Audio player couldn't be initialized: \(error).")
        }
    }

    func stopAudio() {
        audioPlayer?.stop()
    }
}
