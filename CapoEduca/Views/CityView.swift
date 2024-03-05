//
//  CityView.swift
//  CapoEduca
//
//  Created by Silvana Rodrigues Alves on 29/02/24.
//

import SwiftUI

struct CityView: View {
    @Environment(\.presentationMode) var presentationMode
    var userName: String
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "FFFAED")
                    .edgesIgnoringSafeArea(.all)
                
                Image("city")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .scaleEffect(0.7)
                    .offset(y: -80)

                
                ZStack {
                    Image("bottonTest")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 100)
                        .background(Color(hex: "FFFAED"))
                        .cornerRadius(10)
                        .scaleEffect(1.3)
                    
                    
                    Text(" \(userName), CAPOEIRA REPRESENTS A RICH CULTURAL EXPRESSION THAT MASTERFULLY BLENDS DANCE, MUSIC, AND MARTIAL ARTS. ROOTED DEEPLY IN THE AFRICAN-BRAZILIAN TRADITIONS, IT CARRIES THE HISTORICAL LEGACY OF RESISTANCE BY ENSLAVED PEOPLES IN BRAZIL.")
                        .font(.custom("Strange Path", size: 9))
                        .foregroundColor(.black)
                        .lineSpacing(6)
                        .padding(.horizontal, 20)
                        .frame(width: 390, height: 120)
                        .multilineTextAlignment(.center)
                }
                .offset(y: 160)
                
                NavigationLink(destination: InstrumentCardView(userName: userName)) {
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
                .padding()
                .cornerRadius(10)
                .offset(y: 270)
                
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
            }
        }
        .navigationBarBackButtonHidden(true)

    }
}

