//
//  CapoEducaApp.swift
//  CapoEduca
//
//  Created by Silvana Rodrigues Alves on 29/02/24.
//

import SwiftUI

@main
struct CapoEducaApp: App {
    init() {
        let cfURL = Bundle.main.url(forResource: "Strange Path", withExtension: "ttf")!
        
        CTFontManagerRegisterFontsForURL(cfURL as CFURL, CTFontManagerScope.process, nil)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension View {
    func getWidth() -> CGFloat {
        UIScreen.main.bounds.width
    }
    
    func getHeight() -> CGFloat {
        UIScreen.main.bounds.height
    }
}
