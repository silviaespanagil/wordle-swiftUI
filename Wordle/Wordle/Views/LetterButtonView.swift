//
//  LetterButtonView.swift
//  Wordle
//
//  Created by Silvia España on 17/2/22.
//

import SwiftUI

struct LetterButtonView: View {
    
    @EnvironmentObject var dataModel: WordleDataModel
    
    var letter: String
    
    var body: some View {
        
        Button {
            
            dataModel.addToCurrentWord(letter)
        } label: {
            
            Text(letter)
                .font(.system(size: 20))
                .frame(width: 35, height: 50)
                .background(dataModel.keyColors[letter])
                .foregroundColor(.primary)
        }
        .buttonStyle(.plain)
    }
}

struct LetterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LetterButtonView(letter: "L")
            .environmentObject(WordleDataModel())
    }
}

