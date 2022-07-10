//
//  SetGameClassic.swift
//  Set Game
//
//  Created by Jakub Schovanec on 06/07/2022.
//

import SwiftUI

class SetGameClassic: ObservableObject {
    
    private let colors: Array<Color> = [.red, .blue, .green]
    private let shapes: Array<String> = ["diamond", "oval", "squiggle"]
    private let shading: Array<Double> = [1.0, 0.0, 0.25]
    
    @Published var model: SetGame
    
    init() {
        self.model = SetGame()
    }
    
    // MARK: Intents
    func dealCards() {
        model.dealCards()
    }
    
    func newGame() {
        self.model = SetGame()
    }
    
    func choose(_ card: SetGame.Card) {
        model.choose(card)
    }
    
    // MARK: Symbol helpers
    func getColor(of card: SetGame.Card) -> Color {
        return colors[card.color.value - 1]
    }
    func getShape(of card: SetGame.Card) -> String {
        return shapes[card.shape.value - 1]
    }
    func getShading(of card: SetGame.Card) -> Double {
        return shading[card.shading.value - 1]
    }
    func getNumberOfSymbols(of card: SetGame.Card) -> Int {
        return card.number.value
    }
}
