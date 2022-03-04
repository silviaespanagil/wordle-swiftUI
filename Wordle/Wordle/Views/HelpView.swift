//
//  HelpView.swift
//  Wordle
//
//  Created by Silvia España on 4/3/22.
//

import SwiftUI

struct HelpView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                Text("""
Guess the **WORDLE** in 6 tries.

Each gues must be a valid 5 letter word. Hit the enter button to submit.

After each guess, te color of the titles will cahnge to show how close yoru guess was to the word.
""")
                Divider()
                
                Text("**Examples**")
                
                VStack(alignment: .leading) {
                    
                    Image("Weary")
                        .resizable()
                        .scaledToFit()
                    Text("The letter **W** is in the word and in the correct spot")
                    
                    Image("Pills")
                        .resizable()
                        .scaledToFit()
                    Text("The letter **i** is in the word but in the wrong spot")
                    
                    Image("Vague")
                        .resizable()
                        .scaledToFit()
                    Text("The letter **U** is not in the word in any spot")
                }
                Divider()
                
                Text("**Tap the NEW button for a new WORDLE**")
                Spacer()
            }
            .frame(width: min(Global.screenWidth - 40, 350))
            .navigationTitle("HOW TO PLAY")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("**X**")
                    }
                }
            }
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HelpView()
    }
}
