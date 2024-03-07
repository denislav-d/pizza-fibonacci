//
//  EmojiOverlay.swift
//  PizzaFibonacci
//
//  Created by Denislav Dimitrov on 7.03.24.
//

import SwiftUI

struct EmojiOverlay: View {
    let emoji: String
    let position: CGPoint
    
    var body: some View {
        Text(emoji)
            .font(.largeTitle)
            .position(position)
    }
}
