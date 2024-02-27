//
//  IngredientsView-ViewModel.swift
//  PizzaFibonacci
//
//  Created by Denislav Dimitrov on 27.02.24.
//

import Foundation
import SwiftUI

struct Ingredient: Identifiable {
    var name: String
    var emoji: String
    var description: String
    var isSelected: Bool
    let id = UUID()
}

class IngredientsViewModel: ObservableObject {
    var ingredients: [String: [Ingredient]] = [
        "meat": [
            Ingredient(name: "Pepperoni", emoji: "🍖", description: "Classic pepperoni slices", isSelected: false),
            Ingredient(name: "Ham", emoji: "🥩", description: "Sliced ham", isSelected: false),
            Ingredient(name: "Italian Sausage", emoji: "🍗", description: "Italian sausage crumbles", isSelected: false)
        ],
        "vegetables": [
            Ingredient(name: "Tomatoes", emoji: "🍅", description: "Fresh tomatoes sliced thinly", isSelected: false),
            Ingredient(name: "Mushrooms", emoji: "🍄", description: "Sliced mushrooms", isSelected: false),
            Ingredient(name: "Onions", emoji: "🧅", description: "Thinly sliced onions", isSelected: false),
            Ingredient(name: "Bell Peppers", emoji: "🫑", description: "Assorted bell peppers sliced thinly", isSelected: false),
            Ingredient(name: "Olives", emoji: "🫒", description: "Sliced black olives", isSelected: false)
        ],
        "spices": [
            Ingredient(name: "Basil", emoji: "🌿", description: "Fresh basil leaves", isSelected: false),
            Ingredient(name: "Oregano", emoji: "🪴", description: "Dried oregano flakes", isSelected: false),
            Ingredient(name: "Garlic", emoji: "🧄", description: "Minced garlic cloves", isSelected: false)
        ]
    ]
    
    let sectionOrder = ["meat", "vegetables", "spices"]
}

