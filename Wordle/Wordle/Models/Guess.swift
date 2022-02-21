//
//  Guess.swift
//  Wordle
//
//  Created by Silvia España on 17/2/22.
//

import SwiftUI

struct Guess {
    
    let index: Int
    var word = "     "
    var backgroundColors = [Color](repeating: .wrong, count: 5)
    var cardFlipped = [Bool](repeating: false, count: 5)
    var guessLetters: [String] {
        word.map { String($0) }
    }
}
