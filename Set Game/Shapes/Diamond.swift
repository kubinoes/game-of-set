//
//  Diamond.swift
//  Set Game
//
//  Created by Jakub Schovanec on 02/07/2022.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        // we base height from width, since there can be 1-3 shapes on the card, we have fixed hight that will be 1:2 aspect ratio to width
        let height = rect.width / 2
        
        let point1 = CGPoint(x: 0, y: rect.midY)
        let point2 = CGPoint(x: rect.midX, y: rect.midY - height / 2)
        let point3 = CGPoint(x: rect.maxX, y: rect.midY)
        let point4 = CGPoint(x: rect.midX, y: rect.midY + height / 2)
        
        var p = Path()
        
        p.move(to: point1)
        p.addLine(to: point2)
        p.addLine(to: point3)
        p.addLine(to: point4)
        
        return p
    }
}
