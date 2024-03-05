import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                NavigationStack {
                    MainMenuView()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
        }
    }
}
