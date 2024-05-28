//
//  SearchView.swift
//  Tasty Recipe
//
//  Created by Agata Przykaza on 22/05/2024.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var dataModel: DataModel
    
    @State private var searchText = ""
    
    var filteredIngredients: [Recipe] {
        if searchText.isEmpty {
            dataModel.recipies
        } else {
            dataModel.recipies.filter { $0.name.localizedStandardContains(searchText) }
        }
    }
    
    func bindingForRecipe(_ recipe: Recipe) -> Binding<Recipe> {
        guard let recipeIndex = $dataModel.recipies.firstIndex(where: { $0.id.uuidString == recipe.id.uuidString }) else {
                fatalError("Recipe not found")
            }
            return $dataModel.recipies[recipeIndex]
        }
    
    var body: some View {
        NavigationStack {
            List(filteredIngredients) { recipe in
                NavigationLink {
                    RecipeView(recipe: bindingForRecipe(recipe))
                } label: {
                    Text(recipe.name)
                }

            }
            .searchable(text: $searchText, prompt: "Wyszukaj przepis")
            .navigationTitle("Szukaj")
        }
    }
}

#Preview {
    SearchView()
}
