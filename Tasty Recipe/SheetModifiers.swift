//
//  SheetModifiers.swift
//  Tasty Recipe
//
//  Created by Agata Przykaza on 13/05/2024.
//

import SwiftUI

struct DismissButtonModifier: ViewModifier{
    @Environment(\.dismiss) var dismiss
    func body(content: Content) -> some View {
        ZStack{
            Color.clear
                .overlay(alignment: .topTrailing){
                    Button{
                        dismiss()
                    } label: {
                        Image(systemName: "x.circle")
                            .imageScale(.large)
                            .padding()
                    }
                }
            content
        }
    }
}

extension View{
    func withDismissButton() -> some View{
        self.modifier(DismissButtonModifier())
    }
}
