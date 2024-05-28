//
//  Category.swift
//  Tasty Recipe
//
//  Created by Agata Przykaza on 10/04/2024.
//

import Foundation

class Category: Identifiable, Hashable{
   
    
    var id: UUID
    var categoryName: String
    var categoryPic: String
    
    static func == (lhs: Category, rhs: Category) -> Bool {
          return lhs.id == rhs.id && lhs.categoryName == rhs.categoryName && lhs.categoryPic == rhs.categoryPic
      }
    
    init( categoryName: String, categoryPic: String) {
        self.id = UUID()
        self.categoryName = categoryName
        self.categoryPic = categoryPic
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(categoryName)
        hasher.combine(categoryPic)
    }
}


