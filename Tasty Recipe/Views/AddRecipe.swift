//
//  AddRecipe.swift
//  Tasty Recipe
//
//  Created by Agata Przykaza on 21/05/2024.
//

import SwiftUI
import _PhotosUI_SwiftUI

struct AddRecipe: View {
    
    @EnvironmentObject var dataModel: DataModel
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var imagePicker = ImagePicker()
    
    @State var showSheet: Bool = false
    @State var showRemovingSheet: Bool = false
    
    @State var name: String = ""
    @State var desciption: String = ""
    @State  var selectedPreparationTime = "30min"
    
    let preparationTimes: [String] = ["15min", "30min", "45min", "1h", "2h", "3h"]
    
    @State  var selectedPortion = "2"
    let portions = ["1","2","3","4","5","6","7","8"]
    
    @State var unit = "ml"
    @State var quantity: String = ""
    let units = ["ml","g","kg","l","sztuk"]
 
    
    @State var ingredientList: [Ingredient] = []
    
    @State var category: String = "TORTY"
    var categories: [Category] {
        return dataModel.categories
    }
    
    var body: some View {
        
        VStack{
            Form{
                
                Section{
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
                    .listRowBackground(Color.yellow)
                    .frame(maxWidth: .infinity)
                    
                }
                TextField("Nazwa potrawy", text: $name)
                
                
                Picker("Kategoria", selection: $category) {
                    ForEach(categories){ category in
                        
                        Text(category.categoryName).tag(category.categoryName)
                        
                    }
                }
                
                Section{
                    
                    
                    //Czas przepisu
                    HStack{
                        Label(
                            title: { Text("Czas") },
                            icon: { Image(systemName: "clock").foregroundStyle(.orange) }
                        )
                        Picker("", selection: $selectedPreparationTime) {
                            ForEach(preparationTimes, id: \.self) { time in
                                Text(time).tag(time)
                                
                                
                            }
                        }
                        
                    }
                    
                    //Ilość porcji
                    HStack{
                        Label(
                            title: { Text("Porcje") },
                            icon: { Image(systemName: "person.2").foregroundStyle(.orange) }
                        )
                        
                        Picker("", selection: $selectedPortion) {
                            ForEach(portions, id: \.self) { portion in
                                Text(portion).tag(portion)
                                
                                
                            }
                        }
                        
                        
                    }
                } header: {
                    Text("Przygotowanie")
                }
                
                Section{
                    ForEach(0..<ingredientList.count, id: \.self) { index in
                        
                        
                        HStack(){
                           
                            Text(ingredientList[index].name)
                                
                              
                            Spacer()
                           
                            HStack(){
                                
                                TextField("ilosc", text: $ingredientList[index].quantity)
                                    .frame(width: 50)
                                
                                
                                
                                Picker("", selection: $ingredientList[index].unit) {
                                    ForEach(units,id: \.self){ unit in
                                        Text(unit).tag(unit)
                                    }
                                }
                                .tint(.orange)
                                
                                
                               
                                
                            }
                            
                        }
                      
                    }
                    
                } header: {
                    HStack{
                        Text("Składniki")
                        
                        Button(action:{
                            showSheet = true
                        }, label: {
                            Image(systemName: "plus.circle")
                        })
                        
                        Button {
                            showRemovingSheet = true
                        } label: {
                            Image(systemName: "minus.circle")
                                .tint(.orange)
                        }

                    }
                    .sheet(isPresented: $showSheet, content: {
                        AddIgredientView(ingredients: $ingredientList,showSheet: $showSheet)
                            .presentationDetents([.medium])
                    })
                    .sheet(isPresented: $showRemovingSheet, content: {
                       RemoveIngredientView(ingredientList: $ingredientList)
                            .presentationDetents([.medium])
                    })
                    
                }
                
                Section{
                    TextField("Opis", text: $desciption,axis: .vertical)
                        .multilineTextAlignment(.leading)
                } header: {
                    Text("Opis")
                }
                
                Button {
                    //ingredientList.remove(at: index)
                    dismiss()
                } label: {
                    Text("Zapisz")
                        .padding()
                        .background(.orange)
                        .foregroundStyle(.white)
                        .clipShape(Capsule())
                }
                .frame(maxWidth: .infinity,alignment: .trailing)
                //.disabled(false)
                .listRowBackground(Color.yellow)
              
               
            }
            .background(Color.yellow)
            .scrollContentBackground(.hidden)
            
            
            
        }
        
    }
}

#Preview {
    AddRecipe()
}
