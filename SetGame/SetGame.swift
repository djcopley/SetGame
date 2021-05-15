//
//  SetGame.swift
//  SetGame
//
//  Created by Daniel Copley on 5/5/21.
//

import Foundation

struct SetGame <CardShape, CardShade, CardColor> {
    private(set) var cardDeck: [Card]
    private var numSelectedCards : Int {
        var numSelected = 0
        for card in cardDeck {
            if card.selected {
                numSelected += 1
            }
        }
        return numSelected
    }
    
    // Constants
    let numberOfCards = 81
    
    init(cardFactory: (Int) -> Card) {
        cardDeck = [Card]()
        for cardIndex in 0..<numberOfCards {
            cardDeck.append(cardFactory(cardIndex))
        }
//        cardDeck.shuffle()
    }
    
    mutating func choose (card: Card) {
        if numSelectedCards == 3 {
            
        }
        if let chosenIndex = cardDeck.firstIndex(matching: card) {
            cardDeck[chosenIndex].selected = !cardDeck[chosenIndex].selected
        }
    }
    
    private func isASet() -> Bool {
        return false
    }
    
    struct Card : Identifiable{
        var count: Int
        var shape: CardShape
        var shading: CardShade
        var color: CardColor
        var selected: Bool = false
        var id: Int
        
        
    }
}
