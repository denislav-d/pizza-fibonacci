//
//  ContentView.swift
//  PizzaFibonacci
//
//  Created by Denislav Dimitrov on 26.02.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            IngredientsView()
                .tabItem { Label("Ingredients", systemImage: "basket")
                }
            
            PizzaView()
                .tabItem { Label("Pizza", systemImage: "fork.knife")
                }
        }
    }
}

#Preview {
    ContentView()
}
