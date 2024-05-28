//
//  FavouriteView.swift
//  Tasty Recipe
//
//  Created by Agata Przykaza on 06/05/2024.
//

import SwiftUI

struct FavouriteView: View {
    
    @EnvironmentObject var dataModel: DataModel
    @State private var refreshTrigger = false
    var body: some View {
        ZStack{
            NavigationStack{
                ScrollView{
                    
                    if likedRecipesBindings().isEmpty {
                        Text("Brak ulubionych przepisów")
                            .font(.headline)
                            .padding()
                    } else {
                        ForEach(likedRecipesBindings(), id: \.wrappedValue.id){ $recipe in
                            NavigationLink(destination: RecipeView(recipe: $recipe), label: {
                                
                                RecipeSubView(recipe: recipe)
                                
                            })
                            
                        }
                        .navigationTitle("Ulubione")
                        .navigationBarTitleDisplayMode(.inline)
                       
                        Spacer()
                        
                    }
                    
                    
                }
            }
        }
        .onAppear {
                        refreshTrigger.toggle()  // Wymuszenie odświeżenia przy każdym pojawieniu się widoku
                    }
            
        }
        
        private func likedRecipesBindings() -> [Binding<Recipe>] {
            return $dataModel.recipies.filter { $recipe in
                recipe.liked
            }
        }
    }
    
    
    
    
    #Preview {
        FavouriteView()
    }
