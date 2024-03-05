//
//  AnimationView.swift
//  CapoEduca
//
//  Created by Silvana Rodrigues Alves on 29/02/24.
//

import SwiftUI
import AVFoundation

struct AnimationView: View {
    var userName: String
    var selectedMovementIDs: [Int]
    @State var currentMovementID = 0
    @State private var showFinishButton = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "FFFAED").edgesIgnoringSafeArea(.all)
                
                .navigationBarItems(leading: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Text("< BACK")
                    }
                    .font(.custom("Strange Path", size: 12))
                    .foregroundColor(.black)
                    .background(Color(hex: "FFFAED"))
                })
                
                PairView(selectedMovementID: currentMovementID)
                    .onAppear {
                        Task {
                            for id in selectedMovementIDs {
                                currentMovementID = id
                                try await Task.sleep(nanoseconds: 3_000_000_000)
                            }
                            showFinishButton = true
                        }
                    }
                
                if showFinishButton {
                    NavigationLink(destination: FinalView(userName: userName)) {
                        ZStack {
                            Image("bottonTest")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                                .cornerRadius(10)
                                .background(Color(hex: "FFFAED"))
                            
                            Text("FINISH")
                                .font(.custom("Strange Path", size: 14))
                                .foregroundColor(.black)
                        }
                    }
                    .offset(y: 250)
                }
            }
        }
        .onAppear {
            GlobalAudioManager.shared.setupAndStartAudio(fileName: "capoeiraMusic", fileType: "mp3")
        }
        .navigationBarBackButtonHidden(true)
    }
}

