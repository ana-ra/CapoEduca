//
//  PairView.swift
//  CapoEduca
//
//  Created by Silvana Rodrigues Alves on 29/02/24.
//



import SwiftUI

struct PairView: View {
    let selectedMovementID: Int
    @State var showPair = false
    @State var rectangle1 = 0.0
    @State var rectangle2 = 0.0

    var body: some View {
        ZStack{
            Color(hex: "FFFAED")

            Image("fundoDupla\(selectedMovementID)a")
                .resizable()
                .scaledToFit()
            
            HStack{
                Spacer()
                Rectangle()
                    .fill(Color(hex: "FFFAED"))
                    .frame(width:(rectangle1))
                   
            }


            Image("fundoDupla\(selectedMovementID)b")
                .resizable()
                .scaledToFit()
    
            HStack{
                Spacer()
                Rectangle()
                    .fill(Color(hex: "FFFAED"))
                    .frame(width:(rectangle2))
                   
            }


            if showPair {
                Image("dupla\(selectedMovementID)")
                    .resizable()
                    .scaledToFit()
            }
         
            
        }
        .onChange(of: selectedMovementID, perform: { _ in
            rectangle1 = getWidth()
            rectangle2 = getWidth()
            withAnimation(.spring){
                showPair = true
            }
            Task{
                try await Task.sleep(nanoseconds: 1000000000)
                withAnimation(.easeInOut) {
                    rectangle2 = 0.0
                }

                try await Task.sleep(nanoseconds: 1000000000)
                withAnimation(.easeInOut) {
                    rectangle1 = 0.0
                }
            }
        })

    }
}

