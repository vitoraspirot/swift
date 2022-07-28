import Foundation
import UIKit

class MemoryGame {
    
    var shuffledCards: [String] = []
    var foundCards : [String] = []
    var numberOfAttempts: Int
    
    init(shuffledCards : [String]){
        self.shuffledCards = shuffledCards
        self.numberOfAttempts = 0
        self.foundCards = []
    }
    
    func addAttempt(){
        numberOfAttempts += 1
        
    }
    
}

extension MemoryGame {
    
    class func shuffleCards() -> MemoryGame {
        let shuffled = cards.shuffled()
        return .init(shuffledCards: shuffled)
        
    }
    
    
    
}

let cards = [
    "dwarf",
    "dwarf",
    "witch",
    "witch",
    "elf",
    "elf",
    "knight",
    "knight",
    "wizard",
    "wizard"
]


