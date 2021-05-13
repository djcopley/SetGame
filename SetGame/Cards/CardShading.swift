//
//  CardShading.swift
//  SetGame
//
//  Created by Daniel Copley on 5/9/21.
//

import SwiftUI

enum CardShading {
    case solid
    case striped
    case open
}

extension Shape {
    public func stripe(angle: Angle = Angle.degrees(90), gap: Int) -> some View {
        self.stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
    }
}
