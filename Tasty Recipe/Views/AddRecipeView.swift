//
//  AddRecipe.swift
//  Tasty Recipe
//
//  Created by Agata Przykaza on 10/04/2024.
//

import SwiftUI
import PhotosUI


struct AddRecipeView: View {
    
    @EnvironmentObject var dataModel: DataModel
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var imagePicker = ImagePicker()
    
    @State var showSheet: Bool = false
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
    
    //@State private var photosPickerItem: PhotosPickerItem?

    
    var body: some View {
        ScrollView {
        LazyVStack {
            
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
                     .tint(.yellow)
                     .overlay {
                         Text("Dodaj zdj")
                             .foregroundStyle(.black)
                             .bold()
                     }
              }
                
                VStack(alignment: .leading){
                    
                    
                    HStack {
                        TextField("Nazwa potrawy", text: $name)
                             .background(Color.yellow)
                         
                        Picker("Kategoria", selection: $category) {
                            ForEach(categories){ category in
                                
                                Text(category.categoryName).tag(category.categoryName)
                                
                            }
                        }
                        
                    }
                    .padding()
                    
                    
                    
                    HStack{
                     //Czas przepisu
                        Label(
                            title: { Text("Czas") },
                            icon: { Image(systemName: "clock") }
                        )
                        
                        Picker("Time", selection: $selectedPreparationTime) {
                            ForEach(preparationTimes, id: \.self) { time in
                                Text(time).tag(time)
                                
                                    
                                }
                            }
                        .tint(.orange)
                        
                        Spacer()
                    //Ilość porcji
                        Label(
                            title: { Text("Porcje") },
                            icon: { Image(systemName: "person.2") }
                        )
                        
                        Picker("Portion", selection: $selectedPortion) {
                            ForEach(portions, id: \.self) { portion in
                                Text(portion).tag(portion)
                                
                                    
                                }
                            }
                        .tint(.orange)
                    }
                    //.padding(.horizontal)
                    
                    
                    Button(action: {
                        //dodanie składniku
                       showSheet = true
                        
                    }, label: {
                       Rectangle()
                            .frame(width: 150,height: 50)
                            .clipShape(.capsule)
                            .tint(.yellow)
                            .overlay {
                                Text("Dodaj składnik")
                                    .foregroundStyle(.black)
                                    .bold()
                            }
                        
                    })
                    .padding([.horizontal,.top])
                    .sheet(isPresented: $showSheet, content: {
                        AddIgredientView(ingredients: $ingredientList,showSheet: $showSheet)
                            .presentationDetents([.medium])
                    })
                  
                    VStack(alignment: .leading){
                        
                        ForEach(0..<ingredientList.count, id: \.self) { index in
                            
                            HStack(spacing: 10){
                                Label(
                                    title: { Text(ingredientList[index].name) },
                                    icon: { Image(systemName: "circle.fill").font(.footnote) }
                                )
                                .padding(.trailing)
                                
                                Spacer()
                                HStack(spacing: 2){
                                    TextField("ilosc", text: $ingredientList[index].quantity)
                                        .frame(width: 50)
                                        
                                    
                                    Picker("Unit", selection: $ingredientList[index].unit) {
                                        ForEach(units,id: \.self){ unit in
                                            Text(unit).tag(unit)
                                        }
                                    }
                                    .tint(.orange)
                                    
                                   
                                    
                                }
                                
                                Button {
                                    ingredientList.remove(at: index)
                                } label: {
                                    Image(systemName: "x.circle")
                                }

                            }
                            
                        }
                        
                    }
                    .padding(.horizontal)
                    
                    TextField("Opis", text: $desciption,axis: .vertical)
                         .background(Color.yellow)
                         .padding()
                         .multilineTextAlignment(.leading)
                    
                    
                }
                
              
                
                
                Spacer()
            }
          .padding()
          .toolbar {
                      ToolbarItem(placement: .topBarTrailing) {
                          Button(action: {
                              
                              dataModel.addRecipe(Recipe(name: name, picture: "cake", ingriedients: ingredientList, description: desciption, time: selectedPreparationTime, portion: selectedPortion, category: category))
                              
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
}

#Preview {
    AddRecipeView()
}
