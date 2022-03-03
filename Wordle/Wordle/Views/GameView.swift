//
//  GameView.swift
//  Wordle
//
//  Created by Silvia España on 17/2/22.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var dataModel: WordleDataModel
    
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
                                
                            } label: {
                                
                                Image(systemName: "questionmark.circle")
                            }
                        }
                    }
                    
                    ToolbarItem(placement: .principal) {
                        
                        Text("WORDLE")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.primary)
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
                                
                            } label: {
                                Image(systemName: "gearshape.fill")
                            }
                        }
                    }
                }
                
            }
            if dataModel.showStats {
                StatsView()
            }
        }
        .navigationViewStyle(.stack)
    }
}
