//
//  CardView.swift
//  Set Game
//
//  Created by Jakub Schovanec on 08/07/2022.
//

import SwiftUI

struct CardView: View {
    var card: SetGame.Card
    var game: SetGameClassic
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let rectangle = RoundedRectangle(cornerRadius: 10)
                rectangle.fill().foregroundColor(.white)
                
                if card.isSelected {
                    rectangle.strokeBorder(lineWidth: 3).foregroundColor(.green)
                } else if card.isMismatched {
                    rectangle.foregroundColor(.red).opacity(0.5)
                } else if card.isMatched {
                    rectangle.foregroundColor(.green).opacity(0.5)
                } else {
                    rectangle.strokeBorder(lineWidth: 3)
                }
                VStack {
                    Spacer()
                    ForEach(Range(1...game.getNumberOfSymbols(of: card)), id: \.self) { _ in
                        ZStack {
                            let shape = game.getShape(of: card)
                            let color = game.getColor(of: card)
                            let shading = game.getShading(of: card)
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
