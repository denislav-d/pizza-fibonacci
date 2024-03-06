//
//  IngredientsView.swift
//  PizzaFibonacci
//
//  Created by Denislav Dimitrov on 26.02.24.
//

import SwiftUI

struct IngredientsView: View {
    @EnvironmentObject var viewModel: IngredientsViewModel
    @State private var isNextViewActive = false
        
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.ingredients) { ingredient in
                    IngredientRow(ingredient: ingredient, isSelected: ingredient.isSelected)
                }
            }
            .navigationTitle("Ingredients")
            .navigationBarItems(trailing: Button("Next") {
                isNextViewActive = true
            })
            .sheet(isPresented: $isNextViewActive) {
                let fibonacciSequence = viewModel.fibonacciSequence(forSelectedIngredients: viewModel.ingredients)
                PizzaView(ingredients: viewModel.ingredients, fibonacciSequence: fibonacciSequence)
            }
        }
    }
}

#Preview {
    IngredientsView()
}

