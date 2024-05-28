//
//  Tasty_RecipeApp.swift
//  Tasty Recipe
//
//  Created by Agata Przykaza on 12/03/2024.
//

import SwiftUI

@main
struct Tasty_RecipeApp: App {
    @StateObject private var data = DataModel()
    var body: some Scene {
        WindowGroup {
           ContentView()
                .environmentObject(data)
            
            
        }
    }
}
