//
//  DaisyFlower.swift
//  Factory PatternShapes
//
//  Created by MARIJAN VUKCEVICH on 1/9/25.
//

import SwiftUI

struct DaisyFlower: View {
    @State var angle: Double = 0
    @State var scale: CGFloat = 0
        
    var body: some View {
        ZStack {
            ForEach(0..<36) { item in
                    ShapeFactory.getFactory(shapeModifer: .standard).getShape(.daisy)
                    .path(in: CGRect(x: 0, y: 0, width: 110, height: 20))
                    .fill(.yellow.gradient)
                    .frame(width: 110, height: 20)
                    .offset(x: 75)
                    .rotationEffect(.degrees((Double(item) * angle) + 30))
                    .scaleEffect(CGFloat(scale))
            }
        }
        .overlay {
            Circle()
                .frame(width: 60, height: 60)
                .foregroundColor(.orange)
        }
        .padding()
        .onAppear {
            withAnimation(.easeInOut(duration: 4).delay(0.1)) {
                angle = 10
                scale = 1
            }
        }
    }
}
