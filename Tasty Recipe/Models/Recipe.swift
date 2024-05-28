//
//  Recipe.swift
//  Tasty Recipe
//
//  Created by Agata Przykaza on 06/05/2024.
//

import Foundation
class Recipe: Identifiable, Hashable{
    
    func hash(into hasher: inout Hasher) {
           hasher.combine(id)
       }
       
       static func == (lhs: Recipe, rhs: Recipe) -> Bool {
           return lhs.id == rhs.id
       }
    var id: UUID
    var name: String
    var picture: String
    var ingriedients: [Ingredient]
    var description: String
    var time: String
    var portion: String
    var liked: Bool
    var category: String
    
    init( name: String, picture: String, ingriedients: [Ingredient], description: String,time: String,portion: String, liked: Bool = false,category:String) {
        self.id = UUID()
        self.name = name
        self.picture = picture
        self.ingriedients = ingriedients
        self.description = description
        self.time = time
        self.portion = portion
        self.liked = liked
        self.category = category
        
    }
   
    
}

struct Ingredient: Hashable{
    var name: String
    var unit: String = "ml"
    var quantity: String = "0"
}


