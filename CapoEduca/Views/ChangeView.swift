//
//  ChangeView.swift
//  CapoEduca
//
//  Created by Silvana Rodrigues Alves on 29/02/24.
//


import SwiftUI

struct ChangeView: View {
    var userName: String
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView{
            ZStack{
                
             Color(hex: "FFFAED")
               .edgesIgnoringSafeArea(.all)
                
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
                
                Text("EXPLORING NEW SOUNDS IS ALWAYS AN INCREDIBLE EXPERIENCE, \(userName)! I HOPE YOU'VE ENJOYED DIVING INTO THIS UNIVERSE. NOW  LET'S FAMILIARIZE OURSELVES WITH THE MOST COMMON MOVEMENTS. IN CAPOEIRA.")
                    .font(.custom("Strange Path", size: 10))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(12)
                    .padding(.horizontal)
                    .offset(y: -250)
                
                Image("twopeople")
                    .scaleEffect(0.25)
                    .frame(width: 300, height: 100)
                
                NavigationLink(destination: MovementCardView(userName: userName)) {
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
                .offset(y: 230)

            }
            
        }
        .navigationBarBackButtonHidden(true)

        
    }
}

