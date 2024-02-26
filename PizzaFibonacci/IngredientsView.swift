//
//  IngredientsView.swift
//  PizzaFibonacci
//
//  Created by Denislav Dimitrov on 26.02.24.
//

import SwiftUI

struct IngredientsView: View {
    
    var body: some View {
           NavigationView {
               List {
                   ForEach(ingredientGroups) { ingredientGroup in
                       Section(header: Text(ingredientGroup.groupName)) {
                           ForEach(ingredientGroup.ingredients) { ingredient in
                               HStack {
                                   Text(ingredient.emoji)
                                   VStack(alignment: .leading) {
                                       Text(ingredient.name)
                                           .fontWeight(.bold)
                                       Text(ingredient.description)
                                           .font(.subheadline)
                                   }
                               }
                           }
                       }
                   }
               }
               .navigationTitle("Ingredients")
           }
       }
}

#Preview {
    IngredientsView()
}
