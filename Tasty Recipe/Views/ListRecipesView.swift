//
//  ListRecipesView.swift
//  Tasty Recipe
//
//  Created by Agata Przykaza on 16/05/2024.
//

import SwiftUI

struct ListRecipesView: View {
   
    @EnvironmentObject var data: DataModel
    
    var body: some View {
        NavigationStack{
            ScrollView{
                ForEach($data.recipies) { $recipe in
                    NavigationLink(destination: RecipeView(recipe: $recipe), label: {
                        
                        RecipeSubView(recipe: recipe)
                        
                    })
                    
                }
                .navigationTitle("Wszystkie przepisy")
                .navigationBarTitleDisplayMode(.inline)
                
                Spacer()
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    NavigationLink {
                        
                        AddRecipe()
                            .navigationTitle("Nowy przepis")
                           
                            
                    } label: {
                       
                        Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.orange)
                    }
                       
                }
            }
            
        }
        
        
    }
}

#Preview {
    ListRecipesView()
}
