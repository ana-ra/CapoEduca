//
//  MainMenuView.swift
//  CapoEduca
//
//  Created by Silvana Rodrigues Alves on 29/02/24.
//

import SwiftUI

struct MainMenuView: View {
    @StateObject private var viewModel = MainMenuViewModel()
    @State private var showAboutView = false
    @State private var showExplanationView = false
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "FFFAED")
                    .edgesIgnoringSafeArea(.all)
                
                Image("FirstScreen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .scaleEffect(0.75)
                    .offset(x: 0, y: -140)
                
                VStack(spacing: 20) {
                    Text("CAPOEIRA EXPERIENCE")
                        .font(.custom("Strange Path", size: 20))
                        .foregroundColor(.black)
                        .offset(y: 20)

                    
                    Button(action: {
                        showExplanationView = true
                    }) {
                        ZStack {
                            Image("bottonTest")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 50)
                                .cornerRadius(10)
                            
                            Text("START")
                                .font(.custom("Strange Path", size: 20))
                                .foregroundColor(.black)
                        }
                    }
                    .cornerRadius(10)
                    .offset(y: 20)

                    
                    Button(action: {
                        showAboutView = true
                    }) {
                        ZStack {
                            Image("bottonTest")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 50)
                                .cornerRadius(10)
                            
                            Text("ABOUT")
                                .font(.custom("Strange Path", size: 20))
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                    .cornerRadius(10)
                    .offset(y: 10)
                    
                    NavigationLink(destination: AboutView(), isActive: $showAboutView) { EmptyView() }
                    NavigationLink(destination: ExplanationView(), isActive: $showExplanationView) { EmptyView() }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            }
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
    }
}

