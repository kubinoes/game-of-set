//
//  SetGameApp.swift
//  Set Game
//
//  Created by Jakub Schovanec on 22/06/2022.
//

import SwiftUI

@main
struct SetGameApp: App {
    let game = SetGameClassic()
    var body: some Scene {
        WindowGroup {
            SetGameView(game: game)
        }
    }
}
