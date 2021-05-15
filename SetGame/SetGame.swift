//
//  SetGame.swift
//  SetGame
//
//  Created by Daniel Copley on 5/5/21.
//

import Foundation

struct SetGame <CardShape: Equatable, CardShade: Equatable, CardColor: Equatable> {
    // Initialized variables
    private(set) var cardDeck: [Card]
    private(set) var setsFound: Int
    
    // Constants
    let numberOfCards = 81
    
    // Computed properties
    private var threeSelectedCards : (Card, Card, Card)? {
        var selectedCards = [Card]()
        for card in cardDeck {
            if card.selected {
                selectedCards.append(card)
            }
        }
        return selectedCards.count == 3 ? (selectedCards[0], selectedCards[1], selectedCards[2]) : nil
    }
    
    private var shownCards: Int = 12
    var numberOfShownCards: Int {
        get {
            shownCards
        }
        set {
            shownCards = min(12, newValue)
        }
    }
    
    // Initializers
    init(cardFactory: (Int) -> Card) {
        cardDeck = [Card]()
        setsFound = 0
        
        for cardIndex in 0..<numberOfCards {
            cardDeck.append(cardFactory(cardIndex))
        }
        
//        cardDeck.shuffle()
    }
    
    // User interactions
    mutating func choose (card: Card) {
        if let chosenIndex = cardDeck.firstIndex(matching: card) {
            cardDeck[chosenIndex].selected = !cardDeck[chosenIndex].selected
        }
    }
    
    private func isASet() -> Bool {
        return false
    }
    
    // Card
    struct Card : Identifiable {
        var count: Int
        var shape: CardShape
        var shading: CardShade
        var color: CardColor
        var matched: Bool = false
        var selected: Bool = false
        
        var id: Int
    }
}
