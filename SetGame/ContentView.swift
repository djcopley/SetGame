//
//  ContentView.swift
//  SetGame
//
//  Created by Daniel Copley on 5/5/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var shapeSetGame: ShapeSetGame
    
    // Haptic feedback
    private let haptic = UINotificationFeedbackGenerator()
    
    // Animate banner for a quarter of a second
    private let bannerAnimationTime: Double = 0.25
    // Display banner for two seconds
    private let bannerDisplayTime: Double = 2
    
    @State private var showBanner: Bool = false
    
    private func displayBanner() {
        if shapeSetGame.lastSetAMatch {
            haptic.notificationOccurred(.success)
        } else {
            haptic.notificationOccurred(.error)
        }
        withAnimation(.linear(duration: bannerAnimationTime)) {
            showBanner = true
        }
    }
    
    private func dismissBanner() {
        withAnimation(.linear(duration: bannerAnimationTime)) {
            showBanner = false
        }
    }
    
    private func delayedDismissBanner() {
        DispatchQueue.main.asyncAfter(deadline: .now() + bannerDisplayTime) {
            dismissBanner()
        }
    }
    
    var body: some View {
        VStack {
            ZStack {
                if showBanner {
                    BannerView(success: shapeSetGame.lastSetAMatch)
                        .onTapGesture {
                            dismissBanner()
                        }
                        .onAppear(perform: delayedDismissBanner)
                }
                VStack {
                    Text("Set!")
                        .font(.title)
                    Text("Sets Found: \(shapeSetGame.setsFound)")
                }
                .opacity(showBanner ? 0 : 1)
            }
            
            
            Divider()
            
            Grid(shapeSetGame.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            shapeSetGame.choose(card: card)
                            if shapeSetGame.threeCardsSelectedFlag {
                                displayBanner()
                            } else {
                                dismissBanner()
                            }
                        }
                    }
                    .padding()
            }

            Divider()
            
            Button(action: {
                dismissBanner()
                withAnimation(.easeInOut) {
                    shapeSetGame.addThreeCards()
                }
            }, label: { Text("Add Three Cards") })
            .font(.title)
            
            Spacer()
            
            Button(action: {
                dismissBanner()
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
