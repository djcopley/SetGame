//
//  SetGame.swift
//  SetGame
//
//  Created by Daniel Copley on 5/5/21.
//

import Foundation

struct SetGame <CardShape: Equatable, CardShade: Equatable, CardColor: Equatable> {
    // MARK: Initialized variables
    private(set) var cardDeck: [Card]
    private(set) var setsFound: Int
    
    // MARK: Constants
    let numberOfCards = 81
    
    // MARK: Computed properties
    private var numVisibleCards = 12
    private(set) var numberOfVisibleCards: Int {
        get {
            return numVisibleCards
        }
        set {
            numVisibleCards = max(12, newValue)
        }
    }
    
    private var numberOfSelectedCards: Int {
        var numSelectedCards = 0
        for card in cardDeck {
            if card.selected {
                numSelectedCards += 1
            }
        }
        return numSelectedCards
    }
    
    // MARK: Initializers
    init(cardFactory: (Int) -> Card) {
        cardDeck = [Card]()
        setsFound = 0
        
        for cardIndex in 0..<numberOfCards {
            cardDeck.append(cardFactory(cardIndex))
        }
        
        cardDeck.shuffle()
    }
    
    // MARK: Model Functions
    mutating func choose (card: Card) {
        print("Card selected: \(card)")
        
        // Program should crash if somehow a card not in the deck is chosen
        selectCard(cardIndex: cardDeck.firstIndex(matching: card)!)
        
        if isASet() {
            setsFound += 1
        }
    }
    
    mutating func addThreeCards() {
        numberOfVisibleCards += 3
    }
    
    // MARK: Helper Functions
    private mutating func selectCard(cardIndex: Int) {
        // If more than three cards will be seleced, deselect all
        if !(numberOfSelectedCards < 3) {
            for index in cardDeck.indices {
                cardDeck[index].selected = false
            }
        }
        cardDeck[cardIndex].selected = !cardDeck[cardIndex].selected
    }
    
    private func getIndexOfSelectedCards() -> (Int, Int, Int)? {
        var numSelectedCards = 0
        var result: (Int, Int, Int) = (0, 0, 0)
        
        for index in cardDeck.indices {
            if cardDeck[index].selected {
                switch numSelectedCards {
                case 0:
                    result.0 = index
                case 1:
                    result.1 = index
                default:
                    result.2 = index
                }
                numSelectedCards += 1
            }
        }
        
        if numSelectedCards != 3 {
            return nil
        }
        return result
    }
    
    private mutating func isASet() -> Bool {
        if let selectedCardIndices = getIndexOfSelectedCards() {
            let card1 = cardDeck[selectedCardIndices.0]
            let card2 = cardDeck[selectedCardIndices.1]
            let card3 = cardDeck[selectedCardIndices.2]
            
            if allItemsSameOrDifferent(a: card1.count, b: card2.count, c: card3.count)
                && allItemsSameOrDifferent(a: card1.shape, b: card2.shape, c: card3.shape)
                && allItemsSameOrDifferent(a: card1.shading, b: card2.shading, c: card3.shading)
                && allItemsSameOrDifferent(a: card1.color, b: card2.color, c: card3.color)
            {
                setFound(cardIndices: selectedCardIndices)
                return true
            }
        }
        
        return false
    }
    
    private func allItemsSameOrDifferent<T: Equatable>(a: T, b: T, c: T) -> Bool {
        return (a == b && b == c) || (a != b && b != c && a != c)
    }
    
    mutating func setFound(cardIndices: (Int, Int, Int)) {
        cardDeck[cardIndices.0].matched = true
        cardDeck[cardIndices.1].matched = true
        cardDeck[cardIndices.2].matched = true
        
        print("Set Found!")
        
        // Subtract three from the visible cards
        numberOfVisibleCards -= 3
    }
    
    // MARK: Card Type
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
