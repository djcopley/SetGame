//
//  BannerView.swift
//  SetGame
//
//  Created by Daniel Copley on 5/15/21.
//

import SwiftUI

struct BannerView: View {
    var success: Bool
    
    private var text : String {
        return  success ? "Set found!" : "Not a set!"
    }
    
    private var bgColor: Color {
        return success ? .green : .red
    }
    
    var body: some View {
        let widthRatio: CGFloat = 0.95
        GeometryReader { geometry in
            let width: CGFloat = geometry.size.width * widthRatio
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(bgColor)
                VStack {
                    Spacer(minLength: 15)
                    Text(text)
                        .foregroundColor(.white)
                        .font(.title2)
                    Spacer(minLength: 15)
                }
            }
            .frame(width: width)
            .offset(x: geometry.size.width * ((1 - widthRatio) / 2), y: 0)
        }
        .frame(height: 50)
        .transition(.move(edge: .top).combined(with: .offset(x: 0, y: -50)))
    }
    
    let cornerRadius: CGFloat = 10.0
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            BannerView(success: true)
            BannerView(success: false)
        }
    }
}
