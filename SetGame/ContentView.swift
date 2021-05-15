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
            VStack {
                Text("Set!")
                    .font(.title)
                Text("Sets Found: \(shapeSetGame.setsFound)")
            }
            
            Divider()
            
            Grid(shapeSetGame.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            shapeSetGame.choose(card: card)
                        }
                    }
                    .padding()
            }

            Divider()
            
            Button(action: {
                withAnimation(.easeInOut) {
                    shapeSetGame.addThreeCards()
                }
            }, label: { Text("Add Three Cards") })
            .font(.title)
            
            Spacer()
            
            Button(action: {
                withAnimation(.easeInOut) {
                    shapeSetGame.newSetGame()
                }
            }, label: {
                Text("New Game")
            })
        }
        .onAppear {
            shapeSetGame.gameReady()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = ShapeSetGame()
        ContentView(shapeSetGame: game)
    }
}
