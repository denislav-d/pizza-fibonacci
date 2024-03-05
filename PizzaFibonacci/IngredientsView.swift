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
        NavigationView {
            List {
                ForEach(viewModel.ingredients) { ingredient in
                    IngredientRow(ingredient: ingredient)
                }
            }
            .navigationTitle("Ingredients")
            .navigationBarItems(trailing: Button("Next") {
                isNextViewActive = true
            })
            .sheet(isPresented: $isNextViewActive) {
                PizzaView(ingredients: viewModel.ingredients)
            }
        }
    }
}

#Preview {
    IngredientsView()
}
