//
//  SetGameApp.swift
//  SetGame
//
//  Created by Daniel Copley on 5/5/21.
//

import SwiftUI

@main
struct SetGameApp: App {
    @StateObject var game = ShapeSetGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(shapeSetGame: game)
        }
    }
}
