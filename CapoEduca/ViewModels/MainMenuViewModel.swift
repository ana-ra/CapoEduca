//
//  MainMenuViewModel.swift
//  CapoEduca
//
//  Created by Silvana Rodrigues Alves on 29/02/24.
//
import Foundation

class MainMenuViewModel: ObservableObject {
    func aboutButtonTapped() {
        print("About button tapped")
    }
    
    @Published var isStartActive: Bool = false
    func startButtonTapped() {
        isStartActive = true
    }
}
