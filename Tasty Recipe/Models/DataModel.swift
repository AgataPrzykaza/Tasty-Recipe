//
//  DataModel.swift
//  Tasty Recipe
//
//  Created by Agata Przykaza on 17/05/2024.
//

import Foundation

class DataModel: ObservableObject{
    
    @Published var categories: [Category] =  [
        Category(categoryName: "TORTY", categoryPic: "cake"),
        Category(categoryName: "LASANGA", categoryPic: "lasania"),
        Category(categoryName: "CIASTA", categoryPic: "cake")
    ]
    
    @Published var recipies: [Recipe] = [
        Recipe(
              name: "Lasagne al Forno",
              picture: "lasania",
              ingriedients: [Ingredient(name: "makaron"), Ingredient(name: "sos pomidorowy"), Ingredient(name: "wołowe mięso"), Ingredient(name: "sól"), Ingredient(name: "ser")],
              description: "Klasyczna potrawa z makaronu zapiekana z bogatym sosem pomidorowym, mięsem mielonym, serem i przyprawami. Idealna na sycący obiad lub kolację.",
              time: "1h",
              portion: "2",
              liked: true,
              category: "TORTY"
              
          ),
          Recipe(
              name: "Lasagne Vegetariane",
              picture: "lasania",
              ingriedients: [Ingredient(name: "makaron"), Ingredient(name: "sos pomidorowy"), Ingredient(name: "warzywa"), Ingredient(name: "sól"), Ingredient(name: "pomidor")],
              description: "Zdrowa i aromatyczna wersja lasagne bez mięsa. Warzywa nadają potrawie świeżość i bogactwo smaków. Świetny wybór dla osób preferujących dania bezmięsne.",
              time: "1h",
              portion: "2",
              category: "LASANGA"
          ),
          Recipe(
              name: "Lasagne z Białym Sosem",
              picture: "lasania",
              ingriedients: [Ingredient(name: "makaron"), Ingredient(name: "sos czosnkowy"), Ingredient(name: "kurczak"), Ingredient(name: "sól"), Ingredient(name: "ser")],
              description: "Delikatna i kremowa odmiana lasagne z białym sosem beszamelowym. Mięso drobiowe i aromatyczne przyprawy zapewniają wyjątkowy smak. Idealna dla miłośników łagodnych potraw.",
              time: "1h",
              portion: "2",
              category: "TORTY"
          )
    ]
    
  
    func toggleLiked(for recipe: Recipe) {
           if let index = recipies.firstIndex(where: { $0.id == recipe.id }) {
               recipies[index].liked.toggle()
           }
       }
    
    func addRecipe(_ recipe: Recipe){
        recipies.append(recipe)
    }
    
}
