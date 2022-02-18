//
//  WordleDataModel.swift
//  Wordle
//
//  Created by Silvia España on 17/2/22.
//

import SwiftUI

class WordleDataModel: ObservableObject {
    
    @Published var guesses: [Guess] = []
    @Published var incorrectAttempts = [Int](repeating: 0, count: 6)
    
    var keyColors = [String : Color]()
    var selectedWord = ""
    var currentWord = ""
    var tryIndex = 0
    var inPlay = false
    
    // Computed properties
    var gameStarted: Bool {
        
        !currentWord.isEmpty || tryIndex > 0
    }
    
    var disabledKey: Bool {
        
        !inPlay || currentWord.count == 5
    }
    
    init() {
        
        newGame()
    }
    
    func newGame() {
        
        populateDefaults()
        selectedWord = Global.commonWords.randomElement()!
        currentWord = ""
        inPlay = true
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
        
        currentWord += letter
        updateRow()
    }
    
    func enterWord() {
        
        if verifyWord() {
            
            print("Valid")
        } else {
            
            withAnimation {
                
                self.incorrectAttempts[tryIndex] += 1
            }
            
            incorrectAttempts[tryIndex] = 0
        }
    }
    
    func removeLetterFromCurrentWord() {
        
        currentWord.removeLast()
        updateRow()
    }
    
    func updateRow() {
        
        let guessWord = currentWord.padding(toLength: 5, withPad: " ", startingAt: 0)
        guesses[tryIndex].word = guessWord
    }
    
    func verifyWord() -> Bool {
        
        UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: currentWord)
    }
}
