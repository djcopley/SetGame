//
//  CardColor.swift
//  SetGame
//
//  Created by Daniel Copley on 5/9/21.
//

import SwiftUI

enum CardColor {
    case red
    case green
    case purple
}

extension CardColor {
    var viewColor: Color {
        switch self {
        case .red:
            return Color.red
        case .green:
            return Color.green
        case .purple:
            return Color.purple
        }
    }
}
