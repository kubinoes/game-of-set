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
                CardView(card: card, game: game)
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
            .previewInterfaceOrientation(.portrait)
    }
}
