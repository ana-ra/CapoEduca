//
//  MovementCardView.swift
//  CapoEduca
//
//  Created by Silvana Rodrigues Alves on 29/02/24.
//

import SwiftUI

struct MovementCardView: View {
    var userName: String
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = MovementViewModel()
    let columnSpacing: CGFloat = 5
    
    var columns: [GridItem] {
        Array(repeating: .init(.flexible(), spacing: columnSpacing), count: 3)
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "FFFAED").edgesIgnoringSafeArea(.all)

                ScrollView {
                    VStack {
                        Text(" FANTASTIC! LET'S FIND OUT MORE ABOUT THE COMMON MOVEMENTS IN A CAPOEIRA RODA. TO INTERACT WITH IT, PRESS THE CARDS TO FIND OUT THEIR NAMES.")
                            .font(.custom("Strange Path", size: 10))
                            .foregroundColor(.black)
                            .lineSpacing(12)
                            .padding(.horizontal, 20)
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .multilineTextAlignment(.leading)
                            .padding(.top, 20)
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(viewModel.movements, id: \.name) { movement in
                                Button(action: {
                                    viewModel.toggleSelection(for: movement.name)
                                }) {
                                    VStack {
                                        Image(movement.isSelected ? movement.selectedImageName : movement.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 140)

                                        Text(movement.isSelected ? movement.name : " ")
                                            .font(.custom("Strange Path", size: 10))
                                            .foregroundColor(.black)
                                            .padding(.top, 5)
                                            .frame(height: 20)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)

                        NavigationLink(destination: FourMovementsView(userName: userName)) {
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
                            .offset(y:-30)
                        }
                        .padding(.top, 20)
                    }
                    .padding(.bottom, 50)
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

