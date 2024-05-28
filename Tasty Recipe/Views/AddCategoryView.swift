//
//  AddCategoryView.swift
//  Tasty Recipe
//
//  Created by Agata Przykaza on 20/05/2024.
//

import SwiftUI
import PhotosUI

struct AddCategoryView: View {
    @EnvironmentObject var dataModel: DataModel
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var imagePicker = ImagePicker()
    
    
    @State var name: String = ""
    
    
    @State var category: String = "TORTY"
    
    
    
    
    
    var body: some View {
        Form {
                
                if let image = imagePicker.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width,height:300)
                        .clipped()
                    
                } else {
                    Image( "placeHolder")
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width,height:300)
                        .clipped()
                }
                
                
            HStack{
                Spacer()
                PhotosPicker(selection: $imagePicker.imageSelection,
                             matching: .images,
                             photoLibrary: .shared()) {
                    Rectangle()
                        .frame(width: 120,height: 50)
                        .clipShape(.capsule)
                        .tint(.orange)
                        .overlay {
                            Text("Dodaj zdj")
                                .foregroundStyle(.black)
                                .bold()
                        }
                }
                Spacer()
            }
                
               
              
               
                    
                    
                    TextField("Nazwa kategori", text: $name)
                        .background(Color.white)
                    
               
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    
                    dismiss()
                }) {
                    Text("Zapisz")
                        .foregroundColor(.white)
                        .padding(5)
                        .background(.orange)
                        .clipShape(Capsule())
                }
            }
        }
        
        
        
    }
    
    
    
}


#Preview {
    AddCategoryView()
}
