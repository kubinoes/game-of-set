//
//  SetGame.swift
//  Set Game
//
//  Created by Jakub Schovanec on 05/07/2022.
//

import Foundation

struct SetGame {
    private(set) var deck: [Card]
    private(set) var cardsOnBoard: [Card]
    
    private var selectedIndices: [Int] {
        get {
            cardsOnBoard.indices.filter{
                cardsOnBoard[$0].isSelected
            }
        }
    }
    
    let cardsCountForFirstDeal = 12
    let cardsPerDraw = 3
    
    init() {
        deck = []
        var identifier = 0
        for shape in SetOptions.allCases {
            for color in SetOptions.allCases {
                for shading in SetOptions.allCases {
                    for number in SetOptions.allCases {
                        deck.append(Card(id: identifier, shape: shape, color: color, shading: shading, number: number))
                        identifier += 1
                    }
                }
            }
        }
        deck.shuffle()
        cardsOnBoard = Array(deck.prefix(cardsCountForFirstDeal))
        deck.removeSubrange(0..<cardsCountForFirstDeal)
    }
    
    mutating func dealCards() {
        if !deck.isEmpty {
            let cardsToDeal = Array(deck.prefix(cardsPerDraw))
            cardsOnBoard.append(contentsOf: cardsToDeal)
            deck.removeSubrange(0..<cardsToDeal.count)
        }
        // TODO show popup saying deck is empty
    }
    
    mutating func choose(_ card: Card) {
        if let indexOfCard = cardsOnBoard.firstIndex(of: card) {
            cardsOnBoard[indexOfCard].isSelected = !cardsOnBoard[indexOfCard].isSelected
        }
        print(selectedIndices)
    }
    
    struct Card: Identifiable, Equatable {
        
        let id: Int
        let shape: SetOptions
        let color: SetOptions
        let shading: SetOptions
        let number: SetOptions
        
        var isSelected = false
    }
    enum SetOptions: CaseIterable {
        case first
        case second
        case third
        
        var value: Int {
            switch self {
            case .first:
                return 1
            case .second:
                return 2
            case .third:
                return 3
            }
        }
    }
}
