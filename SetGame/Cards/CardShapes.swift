//
//  CardShapes.swift
//  SetGame
//
//  Created by Daniel Copley on 5/5/21.
//

import SwiftUI

enum CardShape {
    case diamond
    case squiggle
    case oval
}

struct AnyShape: Shape {
    private let builder: (CGRect) -> Path

    init<S: Shape>(_ shape: S) {
        builder = { rect in
            let path = shape.path(in: rect)
            return path
        }
    }

    func path(in rect: CGRect) -> Path {
        return builder(rect)
    }
}

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        let top = CGPoint(x: rect.midX, y: rect.maxY)
        let left = CGPoint(x: rect.minX, y: rect.midY)
        let bot = CGPoint(x: rect.midX, y: rect.minY)
        let right = CGPoint(x: rect.maxX, y: rect.midY)
        
        var path = Path()
        path.move(to: top)
        path.addLine(to: left)
        path.addLine(to: bot)
        path.addLine(to: right)
        path.closeSubpath()
        return path
    }
}

struct Squiggle: Shape {
    func path(in rect: CGRect) -> Path {
        let leftPoint = CGPoint(x: rect.minX, y: rect.maxY)
        let rightPoint = CGPoint(x: rect.maxX, y: rect.minY)
        let leftControlPoint1 = CGPoint(x: rect.minX + (rect.width * 0.4), y: rect.minY + (rect.height * 0.55))
        let leftControlPoint2 = CGPoint(x: rect.maxX, y: rect.maxY)
        let rightControlPoint1 = CGPoint(x: rect.maxX - (rect.width * 0.45), y: rect.maxY - (rect.height * 0.25))
        let rightControlPoint2 = CGPoint(x: rect.maxX - (rect.width * 0.75), y: rect.minY)
        
        var path = Path()
        path.move(to: leftPoint)
        path.addCurve(to: rightPoint, control1: leftControlPoint1, control2: leftControlPoint2)
        path.addCurve(to: leftPoint, control1: rightControlPoint1, control2: rightControlPoint2)
        path.closeSubpath()
        return path
    }
}

struct Oval: Shape {
    func path(in rect: CGRect) -> Path {
        let widthOffset = rect.height / 2
        let start = CGPoint(x: rect.maxX - widthOffset, y: rect.maxY)
        
        let leftArcCenter = CGPoint(x: rect.minX + widthOffset, y: rect.midY)
        let rightArcCenter = CGPoint(x: rect.maxX - widthOffset, y: rect.midY)
        
        var path = Path()
        path.move(to: start)
        path.addArc(center: leftArcCenter, radius: widthOffset, startAngle: Angle.degrees(90), endAngle: Angle.degrees(-90), clockwise: false)
        path.addArc(center: rightArcCenter, radius: widthOffset, startAngle: Angle.degrees(-90), endAngle: Angle.degrees(90), clockwise: false)
        path.closeSubpath()
        return path
    }
}

struct Shape_Previews: PreviewProvider {
    static var previews: some View {
        Diamond()
        Squiggle()
        Oval()
    }
}
