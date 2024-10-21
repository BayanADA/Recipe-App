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
            VStack{
                ZStack{
                    Rectangle()
                        .fill(Color.mainGray)
                        .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
                        .foregroundColor(.mainOrange)
                        .frame(width: 413, height: 181)
                    
                    
                    VStack{
                        
                        Image(systemName: "photo.badge.plus")
                            .foregroundColor(Color("mainOrange"))
                            .font(.system(size: 60))
                        
                        
                        Text("Upload Photo")
                            .font(.system(size: 22))
                            .bold()
                        
                        
                    }
                    
                }
                
                
                    .navigationTitle("Recipe Page")
                
            }}}}

#Preview {
    RecipePage()
}
