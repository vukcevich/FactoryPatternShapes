//
//  ShapeFactory.swift
//  Factory PatternShapes
//
//  Created by MARIJAN VUKCEVICH on 1/9/25.
//

import Foundation
import SwiftUI

enum ShapeType {
    case square
    case circle
    case triangle
    case daisy
}

protocol ShapeProtocol {
    func path(in rect: CGRect) -> Path
}

protocol AbstractShapeFactory {
    func getShape(_ shapeType: ShapeType) -> ShapeProtocol
}

extension ShapeFactory {
    
    struct SquareShape: ShapeProtocol {
        func path(in rect: CGRect) -> Path {
            var squarePath = Path()
            squarePath.move(to: CGPoint(x: rect.minX, y: rect.minY))
            squarePath.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            squarePath.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            squarePath.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            return squarePath
        }
    }
    
    //https://www.swiftanytime.com/blog/shapes-in-swiftui
    struct TriangleShape: ShapeProtocol {
        func path(in rect: CGRect) -> Path {
            var trianglePath = Path()
            trianglePath.move(to: CGPoint(x: rect.midX, y: rect.minY))
            trianglePath.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            trianglePath.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            trianglePath.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
            return trianglePath
        }
    }
    struct CircleShape: ShapeProtocol {
        func path(in rect: CGRect) -> Path {
            var circlePath = Path()
            circlePath.addArc(center: CGPoint(x: rect.maxX, y: rect.midY), radius: 50, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: true)
            return circlePath
        }
    }
    
    struct DaisyPental: ShapeProtocol {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addArc(center: CGPoint(x: rect.maxX, y: rect.midY), radius: rect.maxX*(1/11), startAngle: .degrees(90), endAngle: .degrees(270), clockwise: true)
            return path
        }
    }
    
    struct StandardShapeFactory: AbstractShapeFactory {
        func getShape(_ shapeType: ShapeType) -> ShapeProtocol {
            switch shapeType {
            case .square:
                return SquareShape()
            case .circle:
                return CircleShape()
            case .triangle:
                return TriangleShape()
            case .daisy:
                return DaisyPental()
            }
        }
    }
    
    struct RoundedSquare: ShapeProtocol {
        func path(in rect: CGRect) -> Path {
            let size = min(rect.width, rect.height)
            return Path(roundedRect: CGRect(x: (rect.width - size) / 2, y: (rect.height - size) / 2, width: size, height: size), cornerRadius: 10)
        }
    }
    struct RoundedTriangle: ShapeProtocol {
        func path(in rect: CGRect) -> Path {
            let trianglePath = Path()
            return trianglePath
        }
    }
    
    //Silly example:
    struct RoundedCircle: ShapeProtocol {
        func path(in rect: CGRect) -> Path {
            let circlePath = Path()
            return circlePath
        }
    }
    
    struct RoundedDaisy: ShapeProtocol {
        func path(in rect: CGRect) -> Path {
            let path = Path()
            return path
        }
    }
    
    struct RoundedShapeFactory: AbstractShapeFactory {
        func getShape(_ shapeType: ShapeType) -> ShapeProtocol {
            switch shapeType {
            case .square:
                return RoundedSquare()
            case .circle:
                return RoundedCircle()
            case .triangle:
                return RoundedTriangle()
            case .daisy:
                return RoundedDaisy()
            }
        }
    }
}

enum ShapeModifer {
    case standard
    case rounded
}

struct ShapeFactory {
    static func getFactory(shapeModifer: ShapeModifer) -> AbstractShapeFactory {
        switch shapeModifer {
        case .rounded:
            return RoundedShapeFactory()
        case .standard:
            return StandardShapeFactory()
        }
    }
}
