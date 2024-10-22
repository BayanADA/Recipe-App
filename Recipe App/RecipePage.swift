//
//  RecipePage.swift
//  Recipe App
//
//  Created by Bayan Alshuwaier on 21/10/2024.
//

import SwiftUI


struct RecipePage: View {
    @State public var titleText = ""
    @State public var descriptionText = ""
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.mainGray
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
var body: some View {
    NavigationStack{
        
        VStack{
            
            ZStack{
                
                Rectangle()
                    .fill(Color.mainGray)
                    .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .foregroundColor(.mainOrange)
                    .frame(width: 413, height: 181)
                
                
                VStack{
                    
                    Image(systemName: "photo.badge.plus")
                        .foregroundColor(.mainOrange)
                        .font(.system(size: 60))
                    
                    
                    Text("Upload Photo")
                        .font(.system(size: 22))
                        .bold()
                }
            }
          
            VStack{
                Text("Title")
                    .font(.system(size: 24))
                    .bold()
                    .frame(width: 370.5, height: 29, alignment: .leading)
                
                TextField("Title", text: $titleText)
                    .font(.system(size: 24))
                    .padding()
                    .frame(width: 370.5)
                    .background(Color.mainGray)
                    .cornerRadius(8)
                    .multilineTextAlignment(.leading)
                   
 
                Text("Description")
                    .font(.system(size: 24))
                    .bold()
                    .frame(width: 370.5, height: 29, alignment: .leading)
                
                TextField("Description", text: $descriptionText, axis: .vertical)
                    .font(.system(size: 24))
                    .padding()
                    .frame(width: 370.5)
                    .background(Color.mainGray)
                    .cornerRadius(8)
                    .multilineTextAlignment(.leading)
                    .lineLimit(4...10)
                
                HStack{
                    Text("Add Ingrediant")
                        .font(.system(size: 24))
                        .bold()
                    Spacer()
                    Text(.init(systemName: "plus"))
                        .foregroundColor(.mainOrange)
                    
                    
                }
                .frame(width: 370.5, height: 29)
                
            }
           
            .navigationTitle("New Recipe")
            .toolbar{
                ToolbarItem{
                    Text("Save")
                        .foregroundColor(.mainOrange)
                }
             }
         }
        .padding(.top, -90)
     }
 }
}
#Preview {
RecipePage()
}
