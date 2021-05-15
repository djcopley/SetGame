//
//  ContentView.swift
//  SetGame
//
//  Created by Daniel Copley on 5/5/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var shapeSetGame: ShapeSetGame
    
    
    var body: some View {
        VStack {
            HStack {
                Text("Set!")
                    .font(.title)
            }
            Divider()
            Grid(shapeSetGame.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        shapeSetGame.choose(card: card)
                    }
                    .padding()
            }
            Divider()
            Button(action: {
                shapeSetGame.addThreeCards()
            }, label: { Text("Add Three Cards") })
            .font(.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = ShapeSetGame()
        ContentView(shapeSetGame: game)
    }
}
