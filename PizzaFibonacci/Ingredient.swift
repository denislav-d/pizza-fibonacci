//
//  Ingredient.swift
//  PizzaFibonacci
//
//  Created by Denislav Dimitrov on 26.02.24.
//

import Foundation

struct Ingredient: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let emoji: String
    let description: String
}

struct IngredientGroup: Identifiable, Hashable {
    let id = UUID()
    
    let groupName: String
    let ingredients: [Ingredient]
}

let ingredientGroups : [IngredientGroup] = [
    IngredientGroup(groupName: "Meat", ingredients: [
        Ingredient(name: "Pepperoni", emoji: "🍖", description: "Classic pepperoni slices"),
        Ingredient(name: "Ham", emoji: "🥩", description: "Sliced ham"),
        Ingredient(name: "Italian Sausage", emoji: "🍗", description: "Italian sausage crumbles")
    ]),
    IngredientGroup(groupName: "Vegetables", ingredients: [
        Ingredient(name: "Tomatoes", emoji: "🍅", description: "Fresh tomatoes sliced thinly"),
        Ingredient(name: "Mushrooms", emoji: "🍄", description: "Sliced mushrooms"),
        Ingredient(name: "Onions", emoji: "🧅", description: "Thinly sliced onions"),
        Ingredient(name: "Bell Peppers", emoji: "🫑", description: "Assorted bell peppers sliced thinly"),
        Ingredient(name: "Olives", emoji: "🫒", description: "Sliced black olives")
    ]),
    IngredientGroup(groupName: "Herbs/Spices", ingredients: [
        Ingredient(name: "Basil", emoji: "🌿", description: "Fresh basil leaves"),
        Ingredient(name: "Oregano", emoji: "🪴", description: "Dried oregano flakes"),
        Ingredient(name: "Garlic", emoji: "🧄", description: "Minced garlic cloves")
    ])
]
