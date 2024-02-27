//
//  IngredientsView.swift
//  PizzaFibonacci
//
//  Created by Denislav Dimitrov on 26.02.24.
//

import SwiftUI

struct IngredientsView: View {
    
    @EnvironmentObject var viewModel: IngredientsViewModel
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(viewModel.sectionOrder, id: \.self) { section in
                    Section(header: Text(section.capitalized)) {
                        ForEach(viewModel.ingredients[section]!) { ingredient in
                            IngredientRow(ingredient: ingredient)
                        }
                    }
                }
            }
        }.navigationTitle("Ingredients")
    }
}


#Preview {
    IngredientsView()
}

