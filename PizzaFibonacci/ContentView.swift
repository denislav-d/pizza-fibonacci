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
            
            PizzaView(ingredients: viewModel.ingredients)
                .tabItem { Label("Pizza", systemImage: "fork.knife") }
        }
    }
}

#Preview {
    ContentView()
}
