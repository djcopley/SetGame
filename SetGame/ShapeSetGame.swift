//
//  DefaultSetGame.swift
//  SetGame
//
//  Created by Daniel Copley on 5/5/21.
//

import Foundation
import SwiftUI

class ShapeSetGame: ObservableObject {
    @Published private var setGame = SetGame<CardShape, CardShading, CardColor>(numCards: 12) {
        SetGame.Card(count: $0 % 3 + 1, shape: .oval, shading: .striped, color: .green, id: $0)
    }

    // MARK: Access to the Model
    var cards: [SetGame<CardShape, CardShading, CardColor>.Card] {
        return setGame.cards
    }
    
    // MARK: Intents
    func choose(card: SetGame<CardShape, CardShading, CardColor>.Card) {
        setGame.choose(card: card)
    }
}
