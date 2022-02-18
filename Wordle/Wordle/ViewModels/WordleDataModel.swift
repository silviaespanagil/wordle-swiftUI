//
//  WordleDataModel.swift
//  Wordle
//
//  Created by Silvia España on 17/2/22.
//

import SwiftUI

class WordleDataModel: ObservableObject {
    
    @Published var guesses: [Guess] = []
    
    var keyColors = [String : Color]()
    
    init() {
        
        newGame()
    }
    
    func newGame() {
        
        populateDefaults()
    }
    
    func populateDefaults() {
        
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        guesses = []
        
        for index in 0...5 {
            
            guesses.append(Guess(index: index))
        }
        
    
        for char in letters {
            keyColors[String(char)] = .unused
        }
    }
    
    func addToCurrentWord(_ letter: String) {
        
    }
    
    func enterWord() {
        
    }
    
    func removeLetterFromCurrentWord() {
        
    }
}
