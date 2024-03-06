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

