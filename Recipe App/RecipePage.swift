//
//  RecipePage.swift
//  Recipe App
//
//  Created by Bayan Alshuwaier on 21/10/2024.
//

import SwiftUI

struct RecipePage: View {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.mainGray
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    var body: some View {
NavigationStack{


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
        .frame(width: 366, height: 29, alignment: .leading)
    
    TextField("Title", text: .constant(""))
        .font(.system(size: 24))
        .padding()
        .frame(width: 366, height: 47)
        .background(Color.mainGray)
        .cornerRadius(8)
    
    Text("Description")
        .font(.system(size: 24))
        .bold()
        .frame(width: 370.5, height: 29, alignment: .leading)
    
    TextField("Description", text: .constant(""))
        .font(.system(size: 24))
        .padding()
        .frame(width: 368, height: 130)
        .background(Color.mainGray)
        .cornerRadius(8)
    HStack{
        Text("Add Ingrediant")
            .font(.system(size: 24))
            .bold()
         Spacer()
        Text(.init(systemName: "plus"))
            .foregroundColor(.mainOrange)
            
    }
    .frame(width: 371.5, height: 29)
    
}
    
    

    
        .navigationTitle("Recipe Page")
        .toolbar{
            ToolbarItem{
                Text("Save")
                    .foregroundColor(.mainOrange)
                
            }
            
        }}}}

#Preview {
    RecipePage()
}
