//
//  Oval.swift
//  Set Game
//
//  Created by Jakub Schovanec on 02/07/2022.
//

import SwiftUI

struct Oval: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        let topY = rect.height * 0.37
        let bottomY = rect.height * 0.63
        let leftX = rect.width * 0.25
        let rightX = rect.width * 0.75
        
        let point1 = CGPoint(x: 0, y: rect.midY)
        let point2 = CGPoint(x: leftX, y: topY)
        let point3 = CGPoint(x: rightX, y: topY)
        let point4 = CGPoint(x: rect.maxX, y: rect.midY)
        let point5 = CGPoint(x: rightX, y: bottomY)
        let point6 = CGPoint(x: leftX, y: bottomY)
        
        let controlPoint1 = CGPoint(x: 0, y: topY)
        let controlPoint2 = CGPoint(x: rect.maxX, y: topY)
        let controlPoint3 = CGPoint(x: rect.maxX, y: bottomY)
        let controlPoint4 = CGPoint(x: 0, y: bottomY)
        
        p.move(to: point1)
        p.addQuadCurve(to: point2, control: controlPoint1)
        p.addLine(to: point3)
        p.addQuadCurve(to: point4, control: controlPoint2)
        p.addQuadCurve(to: point5, control: controlPoint3)
        p.addLine(to: point6)
        p.addQuadCurve(to: point1, control: controlPoint4)
        
        return p
    }
}

