//
//  MovementViewModel.swift
//  CapoEduca
//
//  Created by Silvana Rodrigues Alves on 29/02/24.
//

import Foundation
class MovementViewModel: ObservableObject {
    @Published var movements: [MovementModel] = [
        MovementModel(name: "ARMADA",  imageName: "Armada", selectedImageName: "Armada2"),
        MovementModel(name: "NEGATIVA",  imageName: "Negativa", selectedImageName: "Negativa2"),
        MovementModel(name: "AU",  imageName: "Au", selectedImageName: "Au2"),
        MovementModel(name: "BENSA",  imageName: "Bencao", selectedImageName: "Bencao2"),
        MovementModel(name: "MEIALUA",  imageName: "Meialua", selectedImageName: "Meialua2"),
        MovementModel(name: "MARTELO",  imageName: "Martelo", selectedImageName: "Martelo2"),
        MovementModel(name: "VOADOR",  imageName: "Voador", selectedImageName: "Voador2")
    ]
    @Published var showAlert = false


    func toggleSelection(for movementName: String) {
        if let index = movements.firstIndex(where: { $0.name == movementName }) {
            movements[index].isSelected.toggle()
            checkIfAllSelected()
        }
    }

    private func checkIfAllSelected() {
        showAlert = movements.filter { $0.isSelected }.count == 7
    }
}


