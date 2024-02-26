//
//  IngredientRow.swift
//  PizzaFibonacci
//
//  Created by Denislav Dimitrov on 26.02.24.
//

import SwiftUI

struct IngredientRow: View {
    
    @State var ingredient: Ingredient
    
    var body: some View {
        
        HStack {
            Text(ingredient.emoji)
            Text(ingredient.name)
            Spacer()
            Image(systemName: ingredient.isSelected ? "plus" : "minus")
                .foregroundColor(ingredient.isSelected ? .green : .red)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            self.ingredient.isSelected.toggle()
                 }
        .scaleEffect(ingredient.isSelected ? 1.05 : 1.0)
        .animation(.easeOut(duration: 0.4), value: ingredient.isSelected)
    }
}

struct IngredientRow_Previews: PreviewProvider {
    static var previews: some View {
        IngredientRow(ingredient: Ingredient(name: "Pepperoni", emoji: "🍖", isSelected: true))
            .padding()
    }
}
