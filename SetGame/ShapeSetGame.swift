//
//  DefaultSetGame.swift
//  SetGame
//
//  Created by Daniel Copley on 5/5/21.
//

import Foundation
import SwiftUI

class ShapeSetGame: ObservableObject {
    @Published private var setGame: SetGame<CardShape, CardShading, CardColor>
    
    // Card Factory Function
    private static let setGameCardFactory: (Int) -> SetGame<CardShape, CardShading, CardColor>.Card = {
        let shapeCount = (($0 / 27) % 3) + 1
        
        let shapeNum = ($0 / 9) % 3
        let shadingNum = ($0 / 3) % 3
        let colorNum = $0 % 3
            
        var shape: CardShape {
            switch shapeNum {
            case 0:
                return .diamond
            case 1:
                return .squiggle
            default:
                return .oval
            }
        }
        
        var shading : CardShading {
            switch shadingNum {
            case 0:
                return .solid
            case 1:
                return .striped
            default:
                return .open
            }
        }
        
        var color: CardColor {
            switch colorNum {
            case 0:
                return .red
            case 1:
                return .green
            default:
                return .purple
            }
        }
        
        return SetGame.Card(count: shapeCount, shape: shape, shading: shading, color: color, id: $0)
    }
    
    init () {
        setGame = SetGame(cardFactory: ShapeSetGame.setGameCardFactory)
    }
    
    func newSetGame() {
        setGame = SetGame(cardFactory: ShapeSetGame.setGameCardFactory)
    }
    
    // MARK: Access to the Model
    var cards: [SetGame<CardShape, CardShading, CardColor>.Card] {
        return setGame.cardDeck
    }
    
    var setsFound: Int {
        return setGame.setsFound
    }
    
    // MARK: Intents
    func choose(card: SetGame<CardShape, CardShading, CardColor>.Card) {
        setGame.choose(card: card)
    } 
}
