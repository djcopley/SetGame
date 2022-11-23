//
//  Main View
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
        NavigationStack {
            Text("Found: \(shapeSetGame.setsFound)")
                .font(.caption)
                .foregroundStyle(.secondary)
            
            Grid(shapeSetGame.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            shapeSetGame.choose(card: card)
                        }
                    }
                    .padding()
            }
            .onAppear { shapeSetGame.gameReady() }
            .navigationTitle("Set!")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("New Game") {
                        withAnimation(.easeInOut) {
                            shapeSetGame.newSetGame()
                        }
                    }
                }
                ToolbarItem(placement: .status) {
                    Button {
                        withAnimation(.easeInOut) {
                            shapeSetGame.addThreeCards()
                        }
                    } label: {
                        Text("Draw 3")
                            .padding(.horizontal)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = ShapeSetGame()
        ContentView(shapeSetGame: game)
    }
}
