//
//  ExplanationView.swift
//  CapoEduca
//
//  Created by Silvana Rodrigues Alves on 29/02/24.
//

import SwiftUI

struct ExplanationView: View {
    @StateObject private var viewModel = ExplanationViewModel()
    @State private var navigateToCityView = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 10) {
                    Text("HEY, TO MAKE OUR TIME TOGETHER EVEN MORE ENJOYABLE, WHAT WOULD YOU LIKE TO BE CALLED?")
                        .font(.custom("Strange Path", size: 10))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .lineSpacing(15)
                        .padding(.horizontal)
                        .offset(y: -40)
                    
                    TextField("Enter your name here", text: $viewModel.userName)
                        .padding()
                        .frame(minHeight: 44)
                        .padding(.horizontal, 20)
                        .background(Color.white)
                        .cornerRadius(5)
                        .padding()
                        .padding(.horizontal, 20)
                        .onChange(of: viewModel.userName) { newValue in
                            if newValue.count > 20 {
                                viewModel.userName = String(newValue.prefix(20))
                            }
                        }
                        .colorScheme(.light)
                        .offset(y: -40)

                    

                    Button(action: {
                        viewModel.submitName()
                        hideKeyboard()
                    }) {
                        ZStack {
                            Image("bottonTest")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 40)
                            Text("SUBMIT")
                                .font(.custom("Strange Path", size: 12))
                                .foregroundColor(.black)
                        }
                    }
                    .frame(width: 200, height: 60)
                    .cornerRadius(10)
                    .offset(y: -40)


                    Image("A2")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .padding(.top, 20)
                        .offset(y: -40)


                    if viewModel.showMessage {
                        Text("GREAT \(viewModel.userName.uppercased()), FEEL WELCOME TO THIS EXPERIENCE LET'S FIND OUT WHAT CAPOEIRA IS ALL ABOUT!")
                            .font(.custom("Strange Path", size: 10))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding()
                            .lineSpacing(10)
                        
                        Button(action: {
                            self.navigateToCityView = true
                        }) {
                            ZStack {
                                Image("bottonTest")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 40)
                                    .cornerRadius(10)
                                Text("NEXT")
                                    .font(.custom("Strange Path", size: 12))
                                    .foregroundColor(.black)
                            }
                        }
                        .padding()
                        .cornerRadius(10)
                        .background(NavigationLink(destination: CityView(userName: viewModel.userName), isActive: $navigateToCityView) { EmptyView() }.hidden())

                    }

                }
                
                .padding(.top, 50)
            }
            .background(Color(hex: "FFFAED").edgesIgnoringSafeArea(.all))
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Text("< BACK")
                }
                .font(.custom("Strange Path", size: 12))
                .foregroundColor(.black)
            })
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

