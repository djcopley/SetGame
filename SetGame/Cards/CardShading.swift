//
//  CardShading.swift
//  SetGame
//
//  Created by Daniel Copley on 5/9/21.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

enum CardShading {
    case solid
    case striped
    case open
}

extension Shape {
    public func stripe(_ fgcolor: Color, width: CGFloat = 1.0, ratio: CGFloat = 4.5) -> some View {
        let filter = CIFilter.stripesGenerator()
        filter.color0 = .clear
        filter.color1 = CIColor(color: UIColor(fgcolor))
        filter.width = Float(width-width*ratio)
        filter.center = CGPoint(x: width, y: 0)
        let size = CGSize(width: width+width*ratio, height: 1)
        let bounds = CGRect(origin: .zero, size: size)
        // keep a reference to a CIContext if calling this often
        
        let stripePattern = CIContext().createCGImage(filter.outputImage!.clamped(to: bounds), from: bounds)!

        return ZStack {
            self.fill(ImagePaint(image: Image(decorative: stripePattern, scale: 1.8))).opacity(0.5)
            self.stroke()
        }
    }
}
