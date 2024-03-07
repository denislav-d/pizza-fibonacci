//
//  PizzaView.swift
//  PizzaFibonacci
//
//  Created by Denislav Dimitrov on 26.02.24.
//

import SwiftUI

struct PizzaView: View {
    let ingredients: [Ingredient]
    let fibonacciSequence: [Int]
    
    var body: some View {
        NavigationView {
            if hasSelectedIngredients {
                List {
                    ForEach(fibonacciSequence.indices, id: \.self) { index in
                        if let ingredientIndex = self.index(of: index) {
                            let ingredient = self.ingredients[ingredientIndex]
                            HStack {
                                Text(ingredient.emoji)
                                VStack(alignment: .leading) {
                                    Text(ingredient.name)
                                    Text(ingredient.description)
                                }
                                Spacer()
                                Text("\(self.fibonacciSequence[index])")
                            }
                        }
                    }
                    
                    // Pizza Image with Emojis Overlay
                    PizzaWithEmojisOverlayView(ingredients: ingredients)
                }
                .navigationTitle("Pizza")
                
            } else {
                Text("No ingredients selected")
                    .foregroundColor(.gray)
                    .font(.headline)
                    .padding()
                    .navigationTitle("Pizza")
            }
        }
    }
    
    var hasSelectedIngredients: Bool {
        return ingredients.contains(where: { $0.isSelected })
    }
    
    func index(of sequenceIndex: Int) -> Int? {
        var count = 0
        return ingredients.firstIndex { ingredient in
            if ingredient.isSelected {
                count += 1
                return count - 1 == sequenceIndex
            }
            return false
        }
    }
}

struct PizzaWithEmojisOverlayView: View {
    let ingredients: [Ingredient]
    
    var body: some View {
        ZStack {
            Image("pizza")
                .resizable()
                .scaledToFit()
            
            // Overlay emojis for selected ingredients
            ForEach(selectedIngredientsWithCounts(), id: \.0.id) { (ingredient, count) in
                ForEach(0..<count, id: \.self) { _ in
                    EmojiOverlay(emoji: ingredient.emoji, position: randomPosition())
                }
            }
        }
    }
    
    // Calculate random position for each emoji
    func randomPosition() -> CGPoint {
        let x = CGFloat.random(in: 50..<250)
        let y = CGFloat.random(in: 50..<250)
        return CGPoint(x: x, y: y)
    }
    
    // Get selected ingredients with their total amounts
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

struct EmojiOverlay: View {
    let emoji: String
    let position: CGPoint
    
    var body: some View {
        Text(emoji)
            .font(.largeTitle)
            .position(position)
    }
}
