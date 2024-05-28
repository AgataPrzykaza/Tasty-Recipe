//
//  ContentView.swift
//  Tasty Recipe
//
//  Created by Agata Przykaza on 10/04/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
            TabView{
                
                MainView()
                    .tabItem {
                        Label("Kategorie", systemImage: "house")
                    }
                
               ListRecipesView()
                    .tabItem {
                        Label("Wszystkie",systemImage: "book.pages.fill")
                    }
                
                FavouriteView()
                    .tabItem {
                        Label("Ulubione", systemImage: "heart")
                           
                    }
                    .background(.white)
                SearchView()
                    .tabItem {
                        Label("Szukaj", systemImage: "magnifyingglass.circle")
                           
                    }
                    .background(.white)
              
            }
            .tint(.orange)
            .onAppear() {
                   UITabBar.appearance().backgroundColor = .white
               }
          
        
        
        
    }
}

#Preview {
    ContentView()
}
