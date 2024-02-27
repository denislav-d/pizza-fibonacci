//
//  PizzaFibonacciApp.swift
//  PizzaFibonacci
//
//  Created by Denislav Dimitrov on 26.02.24.
//

import SwiftUI

@main
struct PizzaFibonacciApp: App {
    
    @StateObject var viewModel = IngredientsViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
