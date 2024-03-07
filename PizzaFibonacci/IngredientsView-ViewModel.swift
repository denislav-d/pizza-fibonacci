//
//  IngredientsView-ViewModel.swift
//  PizzaFibonacci
//
//  Created by Denislav Dimitrov on 27.02.24.
//

import Foundation
import SwiftUI

struct Ingredient: Identifiable, Decodable, Hashable, Equatable {
    var id: Int
    var name: String
    var emoji: String
    var description: String
    var category: String
    var isSelected: Bool
    var amount: Int = 0
}

class IngredientsViewModel: ObservableObject {
    var ingredients: [Ingredient] = load("Ingredients.json")
    
    let sectionOrder = ["Meat", "Vegetables", "Spices and herbs"]
    
    func toggleSelection(for ingredient: Ingredient) {
        if let index = ingredients.firstIndex(where: { $0.id == ingredient.id }) {
            ingredients[index].isSelected.toggle()
        }
    }
    
    func fibonacciSequence(forSelectedIngredients ingredients: [Ingredient]) -> [Int] {

        var fibonacci: [Int] = [1, 1]
        var selectedIngredientsCount = 0
        
        for ingredient in ingredients {
            if ingredient.isSelected {
                selectedIngredientsCount += 1
            }
        }
        
        if selectedIngredientsCount >= 2 {
            for _ in 2..<selectedIngredientsCount {
                let previous = fibonacci[fibonacci.count - 1]
                let secondPrevious = fibonacci[fibonacci.count - 2]
                let nextFibonacci = previous + secondPrevious
                fibonacci.append(nextFibonacci)
            }
        }
        
        var sequenceIndex = 0
        for index in ingredients.indices {
            if ingredients[index].isSelected {
                self.ingredients[index].amount = fibonacci[sequenceIndex]
                sequenceIndex += 1
            }
        }
        return fibonacci
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
