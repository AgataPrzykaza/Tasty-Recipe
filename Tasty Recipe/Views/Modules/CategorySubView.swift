//
//  CategorySubView.swift
//  Tasty Recipe
//
//  Created by Agata Przykaza on 10/04/2024.
//

import SwiftUI

struct CategorySubView: View {
    
    var category: Category
    
    var body: some View {
        
        
        Image(category.categoryPic)
            .resizable()
            .scaledToFill()
            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 100)
            .clipped()
            .overlay(
                VStack {
                    Text(category.categoryName)
                        .foregroundColor(.white)
                        .bold()
                        .font(.title)
                }
            )
        //        VStack{
        //            Text(categoryName)
        //                .font(.title)
        //                .bold()
        //
        //        }
        //        .background()
        //        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: 100)
    }
}

//#Preview {
//    CategorySubView()
//        .previewLayout(.fixed(width: 300, height: 300))
//
//
//}

struct CategorySubView_Previews: PreviewProvider {
    static var previews: some View {
        CategorySubView(category: Category(categoryName: "torty", categoryPic: "cake"))
            .previewLayout(.fixed(width: 500, height: 100))
        
    }
}
