//
//  CardView.swift
//  SetGame
//
//  Created by Daniel Copley on 5/9/21.
//

import SwiftUI

struct CardView: View {
    var card: SetGame<CardShape, CardShading, CardColor>.Card
        
    var body: some View {
        VStack {
            ForEach(0..<card.count) { _ in
                let cardShape = card.shape.viewShape
                let cardColor = card.color.viewColor
                
                switch card.shading {
                case .solid:
                    cardShape.fill()
                case .striped:
                    cardShape.stripe(cardColor) // Can't figure out how to access the forgroundColor prescribed by the viewModifier...
                case .open:
                    cardShape.stroke()
                }
            }
            .aspectRatio(contentAspectRatio, contentMode: .fit)
        }
        .foregroundColor(card.color.viewColor)
        .padding()
        .cardify(selected: card.selected)
    }
    
    // MARK: Drawing Constants
    let contentAspectRatio: CGSize = CGSize(width: 2, height: 1)
}
