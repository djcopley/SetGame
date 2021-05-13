//
//  Cardify.swift
//  SetGame
//
//  Created by Daniel Copley on 5/8/21.
//

import SwiftUI

struct Cardify: ViewModifier {
    var selected: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color.white)
                .shadow(color: selected ? selectedColor : unselectedColor, radius: shadowRadius)
            content
        }
    }
    
    // MARK: Drawing Constants
    let cornerRadius: CGFloat = 10.0
    let shadowRadius: CGFloat = 5.0
    let selectedColor: Color = .orange
    let unselectedColor: Color = Color(.sRGBLinear, white: 0, opacity: 0.33)
}

extension View {
    func cardify(selected: Bool) -> some View {
        modifier(Cardify(selected: selected))
    }
}
