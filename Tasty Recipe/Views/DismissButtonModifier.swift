//
//  DismissButtonModifier.swift
//  Tasty Recipe
//
//  Created by Agata Przykaza on 14/05/2024.
//

import SwiftUI

struct DismissButtonModifier: ViewModifier{
    
    @Environment(\.dismiss) private var dismiss
    
    func body(content: Content) -> some View {
       content
            .toolbar(content: {
                ToolbarItem {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "x.circle")
                            .foregroundStyle(.orange)
                    }

                }
            })
    }
    
}

extension View{
    
    func withDismissButton() -> some View{
        self.modifier(DismissButtonModifier())
    }
    
}
