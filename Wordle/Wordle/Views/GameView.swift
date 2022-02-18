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
        
        NavigationView {
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 3) {
                    
                    GuessView(guess: $dataModel.guesses[0])
                    GuessView(guess: $dataModel.guesses[1])
                    GuessView(guess: $dataModel.guesses[2])
                    GuessView(guess: $dataModel.guesses[3])
                    GuessView(guess: $dataModel.guesses[4])
                    GuessView(guess: $dataModel.guesses[5])
                }
                .frame(width: Global.boardWidht, height: 6 * Global.boardWidht / 5)
                
                Spacer()
                
                KeyboardView()
                    .scaleEffect(Global.keyboardScale)
                    .padding(.top)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "questionmark.circle")
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
        }
        .navigationViewStyle(.stack)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(WordleDataModel())
    }
}
