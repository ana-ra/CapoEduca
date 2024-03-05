//
//  InstrumentViewModel.swift
//  CapoEduca
//
//  Created by Silvana Rodrigues Alves on 29/02/24.
//

import Foundation
import AVFoundation

class InstrumentViewModel: ObservableObject {
    @Published var instruments: [InstrumentModel] = [
        InstrumentModel(name: "Recoreco", imageName: "RECORECO1", selectedImageName: "Recoreco2", soundFileName: "recorecoMusic"),
        InstrumentModel(name: "Agogo", imageName: "AGOGO1", selectedImageName: "Agogo2", soundFileName: "agogoMusic"),
        InstrumentModel(name: "Berimbau", imageName: "BERIMBAU1", selectedImageName: "Berimbau2", soundFileName: "berimbauMusic"),
        InstrumentModel(name: "Atabaque", imageName: "ATABAQUE1", selectedImageName: "Atabaque2", soundFileName: "atabaqueMusic"),
        InstrumentModel(name: "Pandeiro", imageName: "PANDEIRO1", selectedImageName: "Pandeiro2", soundFileName: "pandeiroMusic"),
        InstrumentModel(name: "Caxixi", imageName: "CAXIXI1", selectedImageName: "Caxixi2", soundFileName: "caxixiMusic")
    ]
    
    var audioPlayer: AVAudioPlayer?

    func toggleSelection(for instrumentName: String) {
        if let index = instruments.firstIndex(where: { $0.name == instrumentName }) {
            instruments[index].isSelected.toggle()
            playSound(for: instruments[index])
        }
    }

    func playSound(for instrument: InstrumentModel) {
        guard let soundURL = Bundle.main.url(forResource: instrument.soundFileName, withExtension: "mp3") else {
            print("Arquivo de som para \(instrument.name) não encontrado.")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        } catch {
            print("Não foi possível reproduzir o som do instrumento \(instrument.name). Erro: \(error)")
        }
    }
}
