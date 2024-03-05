//
//  AboutView.swift
//  CapoEduca
//
//  Created by Silvana Rodrigues Alves on 29/02/24.
//

import SwiftUI

struct AboutView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "FFFAED").edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            HStack {
                                Text("< BACK")
                                    .font(.custom("Strange Path", size: 12))
                                    .foregroundColor(.black)
                                    .background(Color(hex: "FFFAED"))
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        
                        Image("myself")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                        
                        Text("""
                            HELLO MY NAME IS SILVANA  AND AS A CAPOEIRA ENTHUSIAST, THIS MARTIAL ART IS NOT JUST A HOBBY FOR ME, BUT AN ESSENTIAL PART OF MY LIFE, IMBUED WITH RICH HISTORY AND CULTURE. IT WAS THIS PASSION THAT INSPIRED ME TO CREATE THIS GAME, A TRIBUTE TO THE BEAUTY AND DYNAMISM OF CAPOEIRA.
                            
                            EVERY VISUAL ELEMENT AND SOUND EFFECT  YOU SEE WAS CAREFULLY HAND-DRAWN BY ME, CAPTURING THE ESSENCE AND MOVEMENT THAT I SO ADMIRE IN THIS PRACTICE. THROUGH SWIFTUI, I FOUND THE PERFECT OPPORTUNITY TO MERGE MY PASSION FOR PROGRAMMING WITH MY LOVE FOR CAPOEIRA, ALLOWING ME TO SHARE NOT JUST THE HISTORICAL ASPECT, BUT ALSO THE FUN AND VIBRANT SIDE OF CAPOEIRA.
                            
                            I HOPE THIS GAME NOT ONLY ENTERTAINS BUT ALSO INSPIRES AN APPRECIATION FOR THE RICH CULTURE AND HISTORY OF CAPOEIRA, WHICH IS SO IMPORTANT TO ME. THANK YOU FOR JOINING ME ON THIS EXPERIENCE.
                            """)
                            .font(.custom("Strange Path", size: 10))
                            .foregroundColor(.black)
                            .lineSpacing(6)
                            .padding()
                            .multilineTextAlignment(.center)
                        
                        Image("about")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                    }
                    .padding(.top, 10)
                }
            }
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
    }
}

