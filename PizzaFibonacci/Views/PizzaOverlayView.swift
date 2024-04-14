//
//  PizzaOverlayView.swift
//  PizzaFibonacci
//
//  Created by Denislav Dimitrov on 7.03.24.
//

import SwiftUI

struct PizzaOverlayView: View {
    let ingredients: [Ingredient]
    
    var body: some View {
        ZStack {
            Image("pizza")
                .resizable()
                .scaledToFit()
            
            ForEach(selectedIngredientsWithCounts(), id: \.0.id) { (ingredient, count) in
                ForEach(0..<count, id: \.self) { _ in
                    EmojiOverlay(emoji: ingredient.emoji, position: randomPosition())
                }
            }
        }
    }
    
    func randomPosition() -> CGPoint {
        let x = CGFloat.random(in: 75..<250)
        let y = CGFloat.random(in: 75..<250)
        return CGPoint(x: x, y: y)
    }
    
    func selectedIngredientsWithCounts() -> [(Ingredient, Int)] {
        var ingredientCounts: [Ingredient: Int] = [:]
        for ingredient in ingredients {
            if ingredient.isSelected {
                ingredientCounts[ingredient, default: 0] += ingredient.amount
            }
        }
        return Array(ingredientCounts)
    }
}

//#Preview {
//    PizzaOverlayView()
//}
