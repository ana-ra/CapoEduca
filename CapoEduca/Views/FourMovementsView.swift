//
//  FourMovementsView.swift
//  CapoEduca
//
//  Created by Silvana Rodrigues Alves on 29/02/24.
//

import SwiftUI

struct FourMovementsView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = FourMovementsViewModel()

    var userName: String

    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
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
                
                VStack{
                    Text("\(userName) TO FINISH OUR EXPERIENCE, SELECT 4 MOVEMENTS TO SEE HOW THE OPPONENT WOULD REACT IN CAPOEIRA FIGHT")
                        .font(.custom("Strange Path", size: 10))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(12)
                        .padding(.horizontal)
                        .offset(y: 10)
                    
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(viewModel.movements, id: \.id) { movement in
                                VStack {
                                    Image(movement.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 170, height: 130)
                                        .cornerRadius(10)
                                        .shadow(color: movement.isSelected ? Color.black.opacity(0.9) : Color.clear, radius: 10, x: 0, y: 0)
                                    Text(movement.name)
                                        .font(.custom("Strange Path", size: 10))
                                        .foregroundColor(.black)
                                        .padding(.top, 5)
                                }
                                .onTapGesture {
                                    viewModel.toggleSelection(for: movement.id)
                                }
                            }
                        }
                        .padding(.horizontal)
                        .offset(y: 40)
                    }
                    
                    NavigationLink(destination: AnimationView(userName: userName, selectedMovementIDs: viewModel.selectedMovementIDs)) {
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
                    .disabled(viewModel.selectedMovementIDs.isEmpty)
                    .padding()
                    .cornerRadius(10)
                }
            }
            .alert(isPresented: $viewModel.selectionLimitReached) {
                Alert(
                    title: Text("Limit Reached"),
                    message: Text("You can select a maximum of 4 movements."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

