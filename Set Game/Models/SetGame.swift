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
            cardsOnBoard.indices.filter {
                cardsOnBoard[$0].isSelected
            }
        }
    }
    
    private var mismatchedIndices: [Int] {
        get {
            cardsOnBoard.indices.filter {
                cardsOnBoard[$0].isMismatched
            }
        }
    }
    
    private var matchedIndices: [Int] {
        get {
            cardsOnBoard.indices.filter {
                cardsOnBoard[$0].isMatched
            }
        }
    }
    
    let cardsCountForFirstDeal = 12
    let cardsPerDraw = 3
    
    init() {
        deck = []
        cardsOnBoard = []
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
        dealCards()
    }
    
    mutating func dealCard(at index: Int) {
        if !deck.isEmpty {
            cardsOnBoard.insert(deck[0], at: index)
            deck.removeFirst()
        }
    }
    
    mutating func dealCards() {
        let cardsCount = cardsOnBoard.isEmpty ? cardsCountForFirstDeal : cardsPerDraw
        if !deck.isEmpty {
            if matchedIndices.count == 3 {
                let sortedMatchedIndices = matchedIndices.sorted(by: >)
                for index in sortedMatchedIndices {
                    cardsOnBoard.remove(at: index)
                    dealCard(at: index)
                }
            } else {
                let cardsToDeal = Array(deck.prefix(cardsCount))
                cardsOnBoard.append(contentsOf: cardsToDeal)
                deck.removeSubrange(0..<cardsToDeal.count)
            }
        }
    }
    
    mutating func choose(_ card: Card) {
        // reset mismatched cards after new card is clicked
        for mismatchedIndex in mismatchedIndices {
            cardsOnBoard[mismatchedIndex].isMismatched = false
        }
        
        if let indexOfCard = cardsOnBoard.firstIndex(where: {$0.id == card.id}) {
            cardsOnBoard[indexOfCard].isSelected = !cardsOnBoard[indexOfCard].isSelected
        }
        checkMatch()
    }
    
    mutating func checkMatch() {
        if selectedIndices.count == 3 {
            let card1 = cardsOnBoard[selectedIndices[0]]
            let card2 = cardsOnBoard[selectedIndices[1]]
            let card3 = cardsOnBoard[selectedIndices[2]]
            
            if isMatch(card1: card1, card2: card2, card3: card3) {
                for index in selectedIndices {
                    cardsOnBoard[index].isMatched = true
                    cardsOnBoard[index].isSelected = false
                }
                // if the current match are last cards on the board, remove them and leave the board empty
                if cardsOnBoard.count <= 3 && deck.count == 0 {
                    cardsOnBoard.removeAll()
                }
            } else {
                for index in selectedIndices {
                    cardsOnBoard[index].isMismatched = true
                    cardsOnBoard[index].isSelected = false
                }
            }
        } else if matchedIndices.count == 3 {
            let sortedMatchedIndices = matchedIndices.sorted(by: >)
            for index in sortedMatchedIndices {
                cardsOnBoard.remove(at: index)
                dealCard(at: index)
            }
        }
    }
    
    // MARK: Helper functions
    
    private func isMatch(card1: Card, card2: Card, card3: Card) -> Bool {
        //return isFeatureMatch(card1Feature: card1.shape, card2Feature: card2.shape, card3Feature: card3.shape) && isFeatureMatch(card1Feature: card1.color, card2Feature: card2.color, card3Feature: card3.color) && isFeatureMatch(card1Feature: card1.shading, card2Feature: card2.shading, card3Feature: card3.shading) && isFeatureMatch(card1Feature: card1.number, card2Feature: card2.number, card3Feature: card3.number)
        return true
    }
    
    private func isFeatureMatch(card1Feature: SetOptions, card2Feature: SetOptions, card3Feature: SetOptions) -> Bool {
        return ((card1Feature == card2Feature) && (card2Feature == card3Feature)) || ((card1Feature != card2Feature) && (card2Feature != card3Feature) && (card1Feature != card3Feature))
    }
    
    // MARK: Card
    
    struct Card: Identifiable, Equatable {
        
        let id: Int
        let shape: SetOptions
        let color: SetOptions
        let shading: SetOptions
        let number: SetOptions
        
        var isSelected = false
        var isMismatched = false
        var isMatched = false
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
