import UIKit

var commonWords: [String] = []

if let words = Bundle.main.url(forResource: "words", withExtension: "txt") {
    
    if let startWords = try? String(contentsOf: words) {
        
        commonWords = startWords.components(separatedBy: "\n")
    } else {
        
        print("Couldn't parse the file")
    }
    
} else {
    
    print("File not found")
}


let removeSet = CharacterSet(charactersIn: "'.-/ABCDEFGHIJKLMNÑOPQRSTUVWXYZ")

let fiveLetterWords = commonWords

// Remove words with mayus or symbols
    .filter { $0.rangeOfCharacter(from: removeSet) == nil }
// Remove words that are not 5 letters long
    .filter { $0.count == 5 }
// Capitalize all
    .map { $0.uppercased() }

print(fiveLetterWords)
