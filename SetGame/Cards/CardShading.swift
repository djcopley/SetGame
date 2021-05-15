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
    public func stripe(colors: (UIColor, UIColor), width: CGFloat, ratio: CGFloat) -> CGImage {
        let filter = CIFilter.stripesGenerator()
            filter.color0 = CIColor(color: colors.0)
            filter.color1 = CIColor(color: colors.1)
            filter.width = Float(width-width*ratio)
            filter.center = CGPoint(x: width, y: 0)
            let size = CGSize(width: width+width*ratio, height: 1)
            let bounds = CGRect(origin: .zero, size: size)
            // keep a reference to a CIContext if calling this often
        return CIContext().createCGImage(filter.outputImage!.clamped(to: bounds), from: bounds)!
        
    }
}
