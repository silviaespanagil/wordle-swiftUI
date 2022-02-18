//
//  KeyboardView.swift
//  Wordle
//
//  Created by Silvia España on 17/2/22.
//

import SwiftUI

struct KeyboardView: View {
    
    @EnvironmentObject var dataModel: WordleDataModel
    
    var topRowArray = "QWERTYUIOP".map{ String($0) }
    var secondRowArray = "ASDFGHJKL".map{ String($0) }
    var thirdRowArray = "ZXCVBNM".map{ String($0) }
    
    var body: some View {
        
        VStack {
            
            HStack(spacing: 2) {
                
                ForEach(topRowArray, id: \.self) { letter in
                    
                    LetterButtonView(letter: letter)
                }
                .disabled(dataModel.disabledKey)
                .opacity(dataModel.disabledKey ? 0.4 : 1)
            }
            HStack(spacing: 2) {
                
                ForEach(secondRowArray, id: \.self) { letter in
                    
                    LetterButtonView(letter: letter)
                }
                .disabled(dataModel.disabledKey)
                .opacity(dataModel.disabledKey ? 0.4 : 1)
            }
            
            HStack(spacing: 2) {
                
                Button {
                    
                    dataModel.enterWord()
                } label: {
                    
                    Text("Enter")
                }
                .font(.system(size: 20))
                .frame(width: 60, height: 50)
                .foregroundColor(.primary)
                .background(Color.unused)
                .disabled(dataModel.currentWord.count < 5 || !dataModel.inPlay)
                .opacity((dataModel.currentWord.count < 5 || !dataModel.inPlay) ? 0.4 : 1)
                
                ForEach(thirdRowArray, id: \.self) { letter in
                    
                    LetterButtonView(letter: letter)
                }
                .disabled(dataModel.disabledKey)
                .opacity(dataModel.disabledKey ? 0.4 : 1)
                
                Button {
                    
                    dataModel.removeLetterFromCurrentWord()
                } label: {
                    
                    Image(systemName: "delete.backward.fill")
                        .font(.system(size: 20, weight: .heavy))
                        .frame(width: 40, height: 50)
                        .foregroundColor(.primary)
                        .background(Color.unused)
                }
                .disabled(dataModel.currentWord.count == 0 || !dataModel.inPlay)
                .opacity((dataModel.currentWord.count == 0 || !dataModel.inPlay) ? 0.4 : 1)
            }
        }
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView()
            .environmentObject(WordleDataModel())
            .scaleEffect(Global.keyboardScale)
    }
}
