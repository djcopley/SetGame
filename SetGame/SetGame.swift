//
//  SetGame.swift
//  SetGame
//
//  Created by Daniel Copley on 5/5/21.
//

import Foundation

struct SetGame <CardShape, CardShade, CardColor> {
    private(set) var cards: [Card]
    
    init(numCards: Int, cardFactory: (Int) -> Card) {
        cards = [Card]()
        for cardIndex in 0..<numCards {
            cards.append(cardFactory(cardIndex))
        }
        cards.shuffle()
    }
    
    mutating func choose (card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card) {
            cards[chosenIndex].selected = !cards[chosenIndex].selected
        }
    }
    
    func isASet() -> Bool {
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
