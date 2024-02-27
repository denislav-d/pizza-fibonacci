//
//  IngredientRow.swift
//  PizzaFibonacci
//
//  Created by Denislav Dimitrov on 26.02.24.
//

import SwiftUI

struct IngredientRow: View {
    
    @EnvironmentObject var viewModel: IngredientsViewModel
    var ingredient: Ingredient
    
    var body: some View {
        HStack {
            Text(ingredient.emoji)
            VStack (alignment: .leading) {
                Text(ingredient.name)
                    .fontWeight(.bold)
                Text(ingredient.description)
                    .font(.subheadline)
            }
            Spacer()
            Image(systemName: ingredient.isSelected ? "minus" : "plus")
                .foregroundColor(ingredient.isSelected ? .red : .green)
        }
        .contentShape(Rectangle())
        .onTapGesture {
                // get ingredient from viewmodel.ingredients based on ingredient.
                // viewModel.ingredients[Ingredient].isSelected.toggle()
                // self.ingredient.isSelected.toggle()
            print(self.ingredient)
        }
        .scaleEffect(ingredient.isSelected ? 1.0 : 1.05)
        .animation(.easeOut(duration: 0.4), value: ingredient.isSelected)
    }
}

#Preview {
        IngredientRow(ingredient: Ingredient(name: "Pepperoni", emoji: "🍖", description: "Freshly sliced pepperoni", isSelected: false))
            .padding()
}
