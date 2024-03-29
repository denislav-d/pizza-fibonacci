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
    @State var isSelected: Bool
    
    var body: some View {
        HStack {
            Text(ingredient.emoji)
            VStack(alignment: .leading) {
                Text(ingredient.name)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(ingredient.description)
                    .font(.subheadline)
            }
            Spacer()
            Image(systemName: isSelected ? "minus" : "plus")
                .foregroundColor(isSelected ? .red : .green)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            isSelected.toggle()
            viewModel.toggleSelection(for: ingredient)
        }
        .scaleEffect(isSelected ? 1.0 : 1.05)
        .animation(.easeOut(duration: 0.4), value: ingredient.isSelected)
    }
}

//#Preview {
//    IngredientRow(ingredient: Ingredient(name: "Pepperoni", emoji: "🍖", description: "Freshly sliced pepperoni", isSelected: true))
//        .padding()
//}
