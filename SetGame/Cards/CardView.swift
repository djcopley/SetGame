//
//  CardView.swift
//  SetGame
//
//  Created by Daniel Copley on 5/9/21.
//

import SwiftUI

struct CardView: View {
    var card: SetGame<CardShape, CardShading, CardColor>.Card

    var cardShape: some Shape {
        switch card.shape {
        case .diamond:
            return AnyShape(Diamond())
        case .squiggle:
            return AnyShape(Squiggle())
        case .oval:
            return AnyShape(Oval())
        }
    }
    
    var cardColor: Color
    {
        switch card.color {
        case .red:
            return Color.red
        case .green:
            return Color.green
        case .purple:
            return Color.purple
        }
    }
    
    
    var body: some View {
        VStack {
            ForEach(0..<card.count) { _ in
                switch card.shading {
                case .solid:
                    cardShape.fill()
                case .striped:
                    cardShape.stripe(cardColor)
                case .open:
                    cardShape.stroke()
                }
            }
            .aspectRatio(contentAspectRatio, contentMode: .fit)
        }
        .foregroundColor(cardColor)
        .padding()
        .cardify(selected: card.selected)
    }
    
    // MARK: Drawing Constants
    let contentAspectRatio: CGSize = CGSize(width: 2, height: 1)
}
