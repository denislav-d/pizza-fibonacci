//
//  Ingredient.swift
//  PizzaFibonacci
//
//  Created by Denislav Dimitrov on 26.02.24.
//

import Foundation

struct Ingredient: Identifiable {
    var name: String
    var emoji: String
    var isSelected: Bool
    let id = UUID()
    
    static func meat() -> [Ingredient] {
        [Ingredient(name: "Pepperoni", emoji: "🍖", isSelected: true),
         Ingredient(name: "Ham", emoji: "🥩", isSelected: false),
         Ingredient(name: "Italian Sausage", emoji: "🍗", isSelected: false)]
    }
    
    static func vegetables() -> [Ingredient] {
        [ Ingredient(name: "Tomatoes", emoji: "🍅", isSelected: true),
          Ingredient(name: "Mushrooms", emoji: "🍄", isSelected: false),
          Ingredient(name: "Onions", emoji: "🧅", isSelected: true),
          Ingredient(name: "Bell Peppers", emoji: "🫑", isSelected: false),
          Ingredient(name: "Olives", emoji: "🫒", isSelected: true)]
    }
    
    static func spices() -> [Ingredient] {
        [Ingredient(name: "Basil", emoji: "🌿", isSelected: true),
         Ingredient(name: "Oregano", emoji: "🪴", isSelected: false),
         Ingredient(name: "Garlic", emoji: "🧄", isSelected: false)]
    }
}

