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
            VStack {
                Grid(shapeSetGame.cards) { card in
                    CardView(card: card)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                shapeSetGame.choose(card: card)
                            }
                        }
                        .padding()
                }
                Group {
                    Text("Sets Found: \(shapeSetGame.setsFound)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .padding(.bottom, 10)

                    Button {
                        withAnimation(.easeInOut) {
                            shapeSetGame.addThreeCards()
                        }
                    } label: {
                        Text("Draw 3")
                            .font(.title3)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding(.horizontal)

            }
            .onAppear { shapeSetGame.gameReady() }
            .navigationTitle("Set!")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        withAnimation(.easeInOut) {
                            shapeSetGame.newSetGame()
                        }
                    } label: {
                        Label("New Game", systemImage: "arrow.counterclockwise")
                    }
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
