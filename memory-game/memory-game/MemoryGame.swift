import Foundation

class MemoryGame {
    
    var shuffledCards: [String] = []
    var numberOfAttempts: Int
    
    init(shuffledCards : [String]){
        self.shuffledCards = shuffledCards
        self.numberOfAttempts = 0
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
    "DWARF",
    "DWARF",
    "WITCH",
    "WITCH",
    "ELF",
    "ELF",
    "KNIGHT",
    "KNIGHT",
    "WIZARD",
    "WIZARD"
]
