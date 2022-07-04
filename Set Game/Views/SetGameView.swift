//
//  SetGameView.swift
//  Set Game
//
//  Created by Jakub Schovanec on 22/06/2022.
//

import SwiftUI

struct SetGameView: View {
    var body: some View {
        CardView().padding()
    }
}

struct CardView: View {
    var isFaceUp = true
    
    var body: some View {
        GeometryReader { geomtry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 10)
                if isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                    VStack {
                        Squiggle().padding().foregroundColor(.blue)
                        //Squiggle().padding().foregroundColor(.blue)
                        //Squiggle().padding().foregroundColor(.blue)
                    }
                } else {
                    shape.fill().foregroundColor(.black)
                }
            }
        }
    }
}






struct SetGameView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView()
    }
}
