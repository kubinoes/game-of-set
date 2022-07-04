//
//  Squiggle.swift
//  Set Game
//
//  Created by Jakub Schovanec on 02/07/2022.
//

import SwiftUI

struct Squiggle: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        let topY = rect.height * 0.37
        let bottomY = rect.height * 0.63
        
        let point1 = CGPoint(x: 0, y: rect.midY)
        let point2 = CGPoint(x: rect.width * 0.25, y: topY)
        let point3 = CGPoint(x: rect.width * 0.85, y: topY)
        let point4 = CGPoint(x: rect.maxX, y: rect.midY)
        
        let point5 = CGPoint(x: rect.width * 0.75, y: bottomY)
        let point6 = CGPoint(x: rect.width * 0.15, y: bottomY)
        
        let controlPoint1 = CGPoint(x: 0, y: topY)
        let controlPoint2first = CGPoint(x: rect.midX, y: topY)
        let controlPoint2second = CGPoint(x: rect.width * 0.6, y: rect.midY)
        let controlPoint3 = CGPoint(x: rect.maxX, y: topY)
        
        let controlPoint4 = CGPoint(x: rect.maxX, y: bottomY)
        let controlPoint5first = CGPoint(x: rect.midX, y: bottomY)
        let controlPoint5second = CGPoint(x: rect.width * 0.4, y: rect.midY)
        let controlPoint6 = CGPoint(x: 0, y: bottomY)
            
        p.move(to: point1)
        p.addQuadCurve(to: point2, control: controlPoint1)
        p.addCurve(to: point3, control1: controlPoint2first, control2: controlPoint2second)
        p.addQuadCurve(to: point4, control: controlPoint3)
        p.addQuadCurve(to: point5, control: controlPoint4)
        p.addCurve(to: point6, control1: controlPoint5first, control2: controlPoint5second)
        p.addQuadCurve(to: point1, control: controlPoint6)
        
        return p
    }
}
