//
//  RemoveIngredientView.swift
//  Tasty Recipe
//
//  Created by Agata Przykaza on 21/05/2024.
//

import SwiftUI

struct RemoveIngredientView: View {
    @Binding var ingredientList: [Ingredient]
    var body: some View {
        Form{
          
                
            Section{
                
                ForEach(0..<ingredientList.count, id: \.self){ index in
                    
                    HStack{
                        Text(ingredientList[index].name)
                        Spacer()
                        Button {
                            ingredientList.remove(at: index)
                        } label: {
                            Image(systemName: "x.circle")
                                .tint(.orange)
                        }
                    }
                    .padding(.horizontal)
                    
                }
            } header: {
                Text("Usuń składniki")
            }
           
        }
        //.padding(.top,20)
        
    }
}


