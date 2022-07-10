//
//  CardView.swift
//  Set Game
//
//  Created by Jakub Schovanec on 08/07/2022.
//

import SwiftUI

struct CardView: View {
    var color: Color
    var shape: String
    var number: Int
    var shading: Double
    var isSelected: Bool
    
    init(color: Color, shape: String, number: Int, shading: Double, isSelected: Bool) {
        self.color = color
        self.shape = shape
        self.number = number
        self.shading = shading
        self.isSelected = isSelected
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let rectangle = RoundedRectangle(cornerRadius: 10)
                rectangle.fill().foregroundColor(.white)
                if isSelected {
                    rectangle.strokeBorder(lineWidth: 3).foregroundColor(.green)
                } else {
                    rectangle.strokeBorder(lineWidth: 3)
                }
                VStack {
                    Spacer()
                    ForEach(Range(1...number), id: \.self) { _ in
                        ZStack {
                            if shape == "diamond" {
                                Diamond().foregroundColor(color).opacity(shading)
                                Diamond().stroke(color, lineWidth: 2)
                            } else if shape == "oval" {
                                Oval().foregroundColor(color).opacity(shading)
                                Oval().stroke(color, lineWidth: 2)
                            } else {
                                Squiggle().foregroundColor(color).opacity(shading)
                                Squiggle().stroke(color, lineWidth: 2)
                            }
                        }.padding(.horizontal)
                    }
                    Spacer()
                }
            }.padding(2)
        }
    }
}
