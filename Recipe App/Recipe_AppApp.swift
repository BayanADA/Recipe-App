//
//  Recipe_AppApp.swift
//  Recipe App
//
//  Created by Bayan Alshuwaier on 20/10/2024.
//

import SwiftUI

@main
struct Recipe_AppApp: App {
    
    @StateObject var recViewModel: RecViewModel = RecViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainPage()
            }
            .environmentObject(recViewModel)
            
        }
    }
}
