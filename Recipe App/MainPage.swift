//
//  MainPage.swift
//  Recipe App
//
//  Created by Bayan Alshuwaier on 20/10/2024.
//

import SwiftUI

struct MainPage: View {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.mainGray
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    var body: some View {
        
NavigationStack{

ZStack {

VStack {
    
    
    
    Image(systemName:("fork.knife.circle"))
        .foregroundColor(Color("mainOrange"))
        .font(.system(size: 274))
        .frame(width: 325, height: 327)
    
    Text("There's no recipe yet")
        .font(.system(size: 34))
        .fontWeight(.bold)
        .frame(width: 330, height: 40)
    
    Text("Please add your recipes")
        .foregroundColor(.gray)
        .font(.system(size: 22))
        .frame(width: 239, height: 26)
    
    
    
        .navigationTitle("Food Recipes")
        .toolbar{
            ToolbarItem{
                Text(.init(systemName: "plus"))
                    .foregroundColor(.mainOrange)
                
      }
                   }
                }
            }
        }
    }
}

#Preview {
    MainPage()
}
