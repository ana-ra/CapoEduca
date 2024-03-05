//
//  Instrument.swift
//  CapoEduca
//
//  Created by Silvana Rodrigues Alves on 29/02/24.
//
import SwiftUI

struct InstrumentCardView: View {
    var userName: String
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = InstrumentViewModel()
    public var columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 20), count: 3)

    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "FFFAED").edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack {
                        Text(" \(userName) AN INTRIGUING ASPECT OF CAPOEIRA IS THAT IT ORIGINATED AS A FORM OF SELF-DEFENSE DISGUISED THROUGH THE RHYTHM OF MUSICAL INSTRUMENTS, BLENDING SMOOTH MOVEMENTS WITH COMBAT, TRANSFORMING IT INTO A DANCE. DIVE DEEPER INTO THE FASCINATING WORLD OF THESE INSTRUMENTS BY INTERACTING WITH THE CARDS TO EXPERIENCE THEIR SOUNDS!")
                            .font(.custom("Strange Path", size: 10))
                            .foregroundColor(.black)
                            .lineSpacing(12)
                            .padding()
                            .multilineTextAlignment(.leading)
                        
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(viewModel.instruments, id: \.name) { instrument in
                                Button(action: {
                                    viewModel.toggleSelection(for: instrument.name)
                                }) {
                                    Image(instrument.isSelected ? instrument.selectedImageName : instrument.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 150)
                                        .cornerRadius(8)
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        NavigationLink(destination: ChangeView(userName: userName)) {
                            ZStack {
                                Image("bottonTest")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 40)
                                    .cornerRadius(10)
                                    .background(Color(hex: "FFFAED"))
                                
                                Text("NEXT")
                                    .font(.custom("Strange Path", size: 14))
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(.top, 20)
                    }
                }
                .navigationBarItems(leading: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Text("< BACK")
                            .font(.custom("Strange Path", size: 12))
                            .foregroundColor(.black)
                            .background(Color(hex: "FFFAED"))
                    }
                })
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

