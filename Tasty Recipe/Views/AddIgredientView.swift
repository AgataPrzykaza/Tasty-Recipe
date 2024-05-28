//
//  AddIgredientView.swift
//  Tasty Recipe
//
//  Created by Agata Przykaza on 08/05/2024.
//

import SwiftUI

struct AddIgredientView: View {
  
    @Binding var  ingredients: [Ingredient]
    @Binding var showSheet: Bool
    @State private var searchText = ""
    
     

        var filteredIngredients: [String] {
            if searchText.isEmpty {
                popularIngredients
            } else {
                popularIngredients.filter { $0.localizedStandardContains(searchText) }
            }
        }

        var body: some View {
            NavigationStack {
                List(filteredIngredients, id: \.self) { ingredient in
                    Text(ingredient)
                        .onTapGesture {
                            ingredients.append(Ingredient(name: ingredient))
                            showSheet = false
                        }
                }
                .searchable(text: $searchText, prompt: "Wyszukaj składnik")
                .navigationTitle("Szukaj")
            }
        }
}
let popularIngredients = [
    "Jajka",
    "Mąka",
    "Cukier",
    "Masło",
    "Olej",
    "Sól",
    "Pieprz",
    "Mleko",
    "Cebula",
    "Czosnek",
    "Pomidory",
    "Papryka",
    "Ser",
    "Makaron",
    "Ryż",
    "Ziemniaki",
    "Marchew",
    "Sałata",
    "Szpinak",
    "Kurczak",
    "Wołowina",
    "Wieprzowina",
    "Ryby",
    "Owoce morza",
    "Ciecierzyca",
    "Awokado",
    "Bakłażan",
    "Kapusta",
    "Brokuły",
    "Dynia"
]

#Preview {
    AddIgredientView(ingredients: .constant([]),showSheet: .constant(true))
}
