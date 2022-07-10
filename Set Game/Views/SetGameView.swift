//
//  SetGameView.swift
//  Set Game
//
//  Created by Jakub Schovanec on 22/06/2022.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var game: SetGameClassic
    
    var body: some View {
        VStack {
            AspectVGrid(items: game.model.cardsOnBoard, aspectRatio: 2/3) { card in
                CardView(color: game.getColor(of: card), shape: game.getShape(of: card), number: game.getNumberOfSymbols(of: card), shading: game.getShading(of: card), isSelected: card.isSelected)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
            HStack {
                Button("Deal 3 more cards") {
                    game.dealCards()
                }.padding().disabled(game.model.deck.count == 0)
                Spacer()
                Button("New Game") {
                    game.newGame()
                }.padding()
            }
        }
    }
}



struct SetGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameClassic()
        return SetGameView(game: game)
    }
}
