//
//  ContentView.swift
//  Tasty Recipe
//
//  Created by Agata Przykaza on 12/03/2024.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var dataModel: DataModel
    @State var showSheet: Bool = false
    
    var body: some View {
        
        
        NavigationStack{
            VStack{
                HStack{
                    Text("Kategorie")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    Spacer()
            

                    NavigationLink {
                       AddCategoryView()
                      
                    } label: {
                        Text("Nowa kategoria")
                            .foregroundStyle(.white)
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                        .foregroundStyle(.orange)               
                    }
                  
                  
    
                    
                }
                .padding()
                .navigationTitle("Tasty Recipe")
                .navigationBarTitleDisplayMode(.inline)
                
                ForEach(dataModel.categories){ category in
                    NavigationLink(destination: RecipeForCategoryView(category: category.categoryName), label: {
                        CategorySubView(category: category)
                            
                    })
                    
                    
                    
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.yellow)
           
        }
        
    }
}

#Preview {
    MainView()
}
