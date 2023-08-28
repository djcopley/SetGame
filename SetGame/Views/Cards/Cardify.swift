//
//  Cardify.swift
//  SetGame
//
//  Created by Daniel Copley on 5/8/21.
//

import SwiftUI

struct Cardify: ViewModifier {
    var selected: Bool
    var animation: Animation? = nil
    
    func body(content: Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color.white)
                .shadow(color: selected ? selectedColor : unselectedColor, radius: shadowRadius)
                .animation(nil, value: selected)
            content
        }
        .animation(animation)
    }
    
    // MARK: Drawing Constants
    let cornerRadius: CGFloat = 10.0
    let shadowRadius: CGFloat = 5.0
    let selectedColor: Color = .orange
    let unselectedColor: Color = Color(.sRGBLinear, white: 0, opacity: 0.33)
}

extension View {
    func cardify(selected: Bool, animation: Animation? = nil) -> some View {
        modifier(Cardify(selected: selected, animation: animation))
    }
}
