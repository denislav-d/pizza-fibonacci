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
            List {
                ForEach(fibonacciSequence.indices, id: \.self) { index in
                    let ingredientIndex = self.index(of: index)
                    if let ingredientIndex = ingredientIndex {
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
            }.navigationTitle("Pizza")
        }
    }
    
    func index(of sequenceIndex: Int) -> Int? {
        var count = 0
        for (index, ingredient) in ingredients.enumerated() {
            if ingredient.isSelected {
                if count == sequenceIndex {
                    return index
                }
                count += 1
            }
        }
        return nil
    }
}
