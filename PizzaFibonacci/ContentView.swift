//
//  ContentView.swift
//  PizzaFibonacci
//
//  Created by Denislav Dimitrov on 26.02.24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: IngredientsViewModel
    
    var body: some View {
        TabView {
            IngredientsView()
                .tabItem { Label("Ingredients", systemImage: "basket") }
            
            let fibonacciSequence = viewModel.fibonacciSequence(forSelectedIngredients: viewModel.ingredients)
            PizzaView(ingredients: viewModel.ingredients, fibonacciSequence: fibonacciSequence)
                .tabItem { Label("Pizza", systemImage: "fork.knife") }
        }
    }
}

#Preview {
    ContentView()
}
