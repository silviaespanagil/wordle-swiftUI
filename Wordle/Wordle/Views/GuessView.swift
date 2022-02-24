//
//  GuessView.swift
//  Wordle
//
//  Created by Silvia España on 17/2/22.
//

import SwiftUI

struct GuessView: View {
    
    @Binding var guess: Guess
    
    var body: some View {
        
        HStack(spacing: 3) {
            
            ForEach(0...4, id: \.self) { index in
                
                FlipView(isFlipped: $guess.cardFlipped[index]) {
                    
                    Text(guess.guessLetters[index])
                        .foregroundColor(.primary)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                        .background(Color.systemBackground)
                } back: {
                    
                    Text(guess.guessLetters[index])
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                        .background(guess.backgroundColors[index])
                }
                .font(.system(size: 35, weight: .heavy))
                .border(Color(.secondaryLabel))
            }
        }
    }
}

struct GuessView_Previews: PreviewProvider {
    static var previews: some View {
        GuessView(guess: .constant(Guess(index: 0)))
    }
}
