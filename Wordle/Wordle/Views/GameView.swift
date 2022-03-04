//
//  GameView.swift
//  Wordle
//
//  Created by Silvia España on 17/2/22.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var dataModel: WordleDataModel
    @State private var showSettings: Bool = false
    @State private var showHelp: Bool = false
    
    var body: some View {
        
        ZStack {
            
            NavigationView {
                
                VStack {
                    
                    Spacer()
                    
                    VStack(spacing: 3) {
                        
                        ForEach(0...5, id:  \.self) { index in
                            
                            GuessView(guess: $dataModel.guesses[index])
                                .modifier(Shake(animatableData: CGFloat(dataModel.incorrectAttempts[index])))
                        }
                    }
                    .frame(width: Global.boardWidht, height: 6 * Global.boardWidht / 5)
                    
                    Spacer()
                    
                    KeyboardView()
                        .scaleEffect(Global.keyboardScale)
                        .padding(.top)
                    
                    Spacer()
                }
                .navigationBarTitleDisplayMode(.inline)
                .disabled(dataModel.showStats)
                .overlay(ToastView(toastText: dataModel.toastText ?? "").offset(y: 20), alignment: .top)
                .toolbar {
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        
                        HStack {
                            if !dataModel.inPlay {
                                
                                Button {
                                    dataModel.newGame()
                                } label: {
                                    
                                    Text("New")
                                        .foregroundColor(.primary)
                                }
                            }
                            
                            Button {
                                showHelp.toggle()
                            } label: {
                                
                                Image(systemName: "questionmark.circle")
                            }
                        }
                    }
                    
                    ToolbarItem(placement: .principal) {
                        
                        Text("WORDLE")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(dataModel.hardMode ? Color(.systemRed) : .primary)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        HStack {
                            
                            Button {
                                withAnimation {
                                    dataModel.showStats.toggle()
                                }
                            } label: {
                                Image(systemName: "chart.bar")
                            }
                            
                            Button {
                                showSettings.toggle()
                            } label: {
                                Image(systemName: "gearshape.fill")
                            }
                        }
                    }
                }
                .sheet(isPresented: $showSettings) {
                    SettingsView()
                }
            }
            if dataModel.showStats {
                StatsView()
            }
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showHelp) {
            HelpView()
        }
    }
}
