//
//  RecipeForCategoryView.swift
//  Tasty Recipe
//
//  Created by Agata Przykaza on 17/05/2024.
//

import SwiftUI

struct RecipeForCategoryView: View {
    @EnvironmentObject var dataModel: DataModel
    @State var category: String
    var body: some View {
        
        ZStack{
            NavigationStack{
                ScrollView{
                    ForEach(categoryRecipes(), id: \.wrappedValue.id){ $recipe in
                        NavigationLink(destination: RecipeView(recipe: $recipe), label: {
                            
                            RecipeSubView(recipe: recipe)
                            
                        })
                        
                    }
                    .navigationTitle(category)
                    .navigationBarTitleDisplayMode(.inline)
                    Spacer()
                }
                
            }
        }
        
        
    }
    
    
    
    
    private func categoryRecipes() -> [Binding<Recipe>] {
        return $dataModel.recipies.filter { $recipe in
            recipe.category == category
        }
    }
}

#Preview {
    RecipeForCategoryView( category: "torty")
}
