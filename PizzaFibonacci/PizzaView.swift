//
//  PizzaView.swift
//  PizzaFibonacci
//
//  Created by Denislav Dimitrov on 26.02.24.
//

import SwiftUI

struct PizzaView: View {
    let ingredients: [Ingredient]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(ingredients) { ingredient in
                    if ingredient.isSelected {
                        IngredientRow(ingredient: ingredient)
                    }
                }
            }.navigationTitle("Pizza")
        }
    }
}
