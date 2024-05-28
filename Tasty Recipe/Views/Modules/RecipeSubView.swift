//
//  RecipeSubView.swift
//  Tasty Recipe
//
//  Created by Agata Przykaza on 06/05/2024.
//

import SwiftUI

struct RecipeSubView: View {
    var recipe: Recipe
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("cake")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 150)
                .clipped()
            
            VStack(alignment: .leading) {
                Spacer()
                
                Text(recipe.name)
                    .font(.headline)
                    .bold()
                    .padding(.horizontal)
                
                HStack{
                    Label(
                        title: { Text(recipe.time) },
                        icon: { Image(systemName: "hourglass") }
                    )
                    .padding(.horizontal)
                    
                    Label(
                        title: { Text(recipe.portion) },
                        icon: { Image(systemName: "person.2") }
                    )
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.white)
            .frame(maxHeight: 30)
        }
        .padding(.top)
        .foregroundStyle(Color.black)
    }
}


