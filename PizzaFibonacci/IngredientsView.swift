//
//  IngredientsView.swift
//  PizzaFibonacci
//
//  Created by Denislav Dimitrov on 26.02.24.
//

import SwiftUI

struct IngredientsView: View {
    
    @State private var meat = Ingredient.meat()
    @State private var vegetables = Ingredient.vegetables()
    @State private var spices = Ingredient.spices()
    
    var body: some View {
        NavigationStack{
            List {
                Section {
                    ForEach(meat) { ingredient in
                        IngredientRow(ingredient: ingredient)
                    }
                } header: {
                    Text("Meat")
                }
                
                Section {
                    ForEach(vegetables) { ingredient in
                        IngredientRow(ingredient: ingredient)
                    }
                } header: {
                    Text("Vegetables")
                }
                
                Section {
                    ForEach(spices) { ingredient in
                        IngredientRow(ingredient: ingredient)
                    }
                } header: {
                    Text("Spices and Herbs")
                }
            }
            .navigationTitle("Ingredients")
        }
    }
}

#Preview {
    IngredientsView()
}

