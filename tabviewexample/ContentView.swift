//
//  ContentView.swift
//  tabviewexample
//
//  Created by Eddy Mendoza on 20/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var navToQrScreen = false
    
    @State var selectionScreen : Screens = .home
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                ZStack {
                    
                    
                    TabView(selection: $selectionScreen) {
                        
                        Tab("Home", systemImage: "house", value: .home){
                            HomeScreen()
                        }
                        
                        Tab("Account", systemImage: "creditcard", value: .account){
                            AccountScreen()
                        }
                        
                        Tab(value: .empty) {
                            EmptyView()
                                .disabled(true)
                        }
                        
                        Tab("Benefits", systemImage: "giftcard", value: .benefits){
                            BenefitsScreen()
                        }
                        
                        Tab("Help", systemImage: "questionmark.circle", value: .help){
                            HelpScreen()
                        }
                        
                    }
                    
                    
                    VStack {
                        Spacer()
                        Divider()
                            .padding(.bottom, 52)
                    }
                    
                    VStack {
                        Spacer()
                        VStack {
                            Button(action: {
                                navToQrScreen = true
                            }) {
                                ZStack {
                                    Circle()
                                        .frame(width: 80, height: 80, alignment: .center)
                                        .foregroundStyle(.blue)
                                        .border(.green, width: 2)
                                    
                                    VStack {
                                        
                                        Image(systemName: "qrcode.viewfinder")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 36, height: 36, alignment: .center)
                                            .foregroundStyle(.white)
                                        
                                        Text("QR")
                                            .foregroundStyle(.white)
                                    }
                                    .border(.cyan, width: 2)
                                }
                                .padding(.bottom, 12)
                                .border(.black, width: 2)
                            }
                            .border(.blue, width: 2)
                        }
                        .border(.red, width: 1)
                    }
                    
                    
                }
            }
            .navigationDestination(isPresented: $navToQrScreen, destination: {
                QrScreen()
                    .onDisappear{
                        navToQrScreen = false
                    }
            })
            .toolbarVisibility(.visible, for: .navigationBar)
            .toolbar {
                
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.white)
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    VStack {
                        Text("Title App")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title3)
                            .bold()
                        
                        Text("Subtitle App")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.headline)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .border(.blue, width: 4)
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    
                    Button(action: {
                        
                    }){
                        ZStack {
                            Circle()
                                .foregroundStyle(.gray)
                                .opacity(0.4)
                            Image(systemName: "bell")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.white)
                                .overlay {
                                    Circle()
                                        .fill(Color.red)
                                        .offset(x:-10, y:10)
                                        .scaleEffect(0.3, anchor: .topTrailing)
                                }
                        }
                    }.frame(width: 48, height: 48)
                    
                    Button(action: {
                        
                    }){
                        ZStack {
                            Circle()
                                .foregroundStyle(.gray)
                                .opacity(0.4)
                            Image(systemName: "cart")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.white)
                        }
                        
                    }.frame(width: 48, height: 48)
                }
        
            }
            .toolbarBackground(.cyan, for: .navigationBar)
            .toolbarBackgroundVisibility(.visible, for: .navigationBar)
        }
        
        
    }
}

#Preview {
    ContentView()
}
