//
//  ContentView.swift
//  Factory PatternShapes
//
//  Created by MARIJAN VUKCEVICH on 1/9/25.
//

//MARK:
//https://www.mastering-swift.com/post/abstract-factory-pattern-protocol-oriented-design-pattern

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Image(systemName: "house")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, Abstact Factory Pattern!")
        }
        ScrollView {
            VStack (spacing: 20) {
                HStack (alignment: .top, spacing: 20) {
                    ShapeFactory.getFactory(shapeModifer: .rounded).getShape(.square)
                        .path(in: CGRect(x: 20, y: 20, width: 80, height: 80))
                        .fill(.orange.gradient)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ShapeFactory.getFactory(shapeModifer: .standard).getShape(.square)
                        .path(in: CGRect(x: 0, y: 0, width: 50, height: 50))
                        .fill(.red.gradient)
                        .frame(maxWidth: 50, maxHeight: 50, alignment: .trailing)
                    
                }
                .padding(.all, 10)
                .border(.black, width: 1)
                .frame(height: 120)
                HStack (alignment: .top, spacing: 20) {
                    ShapeFactory.getFactory(shapeModifer: .standard).getShape(.circle)
                        .path(in: CGRect(x: 50, y: 0, width: 0, height: 100))
                        .fill(.yellow.gradient)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ShapeFactory.getFactory(shapeModifer: .standard).getShape(.triangle)
                        .path(in: CGRect(x: 0, y: 0, width: 50, height: 50))
                        .stroke(.red, style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round))
                        .frame(maxWidth: 50, maxHeight: 50, alignment: .trailing)
                }
                .padding(.all, 10)
                .border(.black, width: 1)
                .frame(height: 120)
            }
            .padding([.leading, .trailing], 20)
            
            ZStack {
                DaisyFlower()
            }
            .padding(.top, 30)
            .frame(height: 260)
        }
    }
}

#Preview {
    ContentView()
}
