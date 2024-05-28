

//  RecipeView.swift
//  Tasty Recipe
//
//  Created by Agata Przykaza on 12/03/2024.
//

import SwiftUI

struct RecipeView: View {

    @EnvironmentObject var dataModel: DataModel
    @Binding var recipe: Recipe
    @State var heart = "heart"

    var body: some View {

        ScrollView{

                Text(recipe.name)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(.bottom,30)

                Image("cake")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width ,height: 200)
                    .padding(.bottom,30)
                    .clipped()

                VStack(alignment: .leading){

                    HStack(){
                        Text("Sładniki")
                            .font(.headline)


                        Spacer()

                        Button(action: {

                            if(recipe.liked == false){
                                heart = "heart.fill"
                                dataModel.toggleLiked(for: recipe)
                            }
                            else{
                                heart = "heart"
                                dataModel.toggleLiked(for: recipe)
                            }


                        }, label: {
                            Image(systemName: heart)
                                .foregroundStyle(.red)
                                .font(.title)
                        })



                    }
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.bottom,7)





                    VStack(alignment: .leading){
                        ForEach(recipe.ingriedients,id: \.self){ ingredient in
                            HStack{
                                Text(ingredient.name)
                                Text(ingredient.quantity)
                                Text(ingredient.unit)
                            }
                            Divider()
                        }



                  }
                    .padding(.bottom,23)




                        Text("Opis")
                            .font(.headline)

                        Text(recipe.description)
                            .multilineTextAlignment(.leading)


                    }
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.horizontal, 30)






        }
        .padding(.bottom)
        .onAppear(){
            heart = recipe.liked ? "heart.fill" : "heart"
        }
    }
}



