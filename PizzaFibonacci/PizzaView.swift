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
        NavigationView {
            List {
                ForEach(ingredients) { ingredient in
                    if ingredient.isSelected {
                        HStack {
                            Text(ingredient.emoji)
                            VStack(alignment: .leading) {
                                Text(ingredient.name)
                                Text(ingredient.description)
                            }
                        }
                    }
                }
            }.navigationTitle("Pizza")
        }
    }
}
