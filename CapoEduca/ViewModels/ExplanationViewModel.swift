//
//  ExplanationViewModel.swift
//  CapoEduca
//
//  Created by Silvana Rodrigues Alves on 29/02/24.
//

import Combine

class ExplanationViewModel: ObservableObject {
    @Published var userName: String = ""
    @Published var showMessage: Bool = false
    
    func submitName() {
        userName = userName.uppercased()
        showMessage = !userName.isEmpty
    }
}
