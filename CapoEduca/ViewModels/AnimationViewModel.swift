//
//  AnimationViewModel.swift
//  CapoEduca
//
//  Created by Silvana Rodrigues Alves on 29/02/24.
//

import Foundation
import AVFoundation

class AnimationViewModel: ObservableObject {
    
    var audioPlayer: AVAudioPlayer?
    
    func setupAndStartAudio(fileName: String, fileType: String) {
        guard let soundURL = Bundle.main.url(forResource: fileName, withExtension: fileType) else {
            print("File not found")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.play()
        } catch {
            print("The audio player could not be configured: \(error)")
        }
    }
    
    func stopAudio() {
        audioPlayer?.stop()
    }
}
