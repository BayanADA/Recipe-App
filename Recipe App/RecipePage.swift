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
    @State var isActive : Bool = false
    @State private var ingAdd = ""
    @State var items: [listModel] = [
        listModel(ingCount: 1, ingTitle: "String", measType: "String")
    ]
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
            
            ZStack{
                HStack{
                    Text("Add Ingrediant")
                        .font(.system(size: 24))
                        .bold()
                    Spacer()
                    Button {
                        isActive = true
                        
                    } label: {
                        Text(.init(systemName: "plus"))
                            .foregroundColor(.mainOrange)
                    }
                }
                
            }
            .frame(width: 370.5, height: 29)
            
        }
        
        .navigationTitle("New Recipe")
        .navigationBarItems(
            leading: EditButton() ,
            trailing: NavigationLink("Save", destination: {
                Text("yes")
            }))
        
        VStack{
            List {
                ForEach(items) { item in
                    ingList(item: item, ingAmount: item)
                    
                }
                .onDelete(perform: deleteIng)
            } .padding(.top, -10)
        }
        .padding(.top, 45)
        
        if isActive{
            Ingrediants(ingTitle: "Ingrediant name", measTitle: "Measurment", servTitle: "Serving", meas1: "🥄 Spoon", meas2: "🥛 Cup", servNum: 1, addButton: {}, isActive: $isActive)
        }
    }
}
}
}
    func deleteIng(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)}
    
 }

class ingAdding {
    var ingCount: Int = 0
    var ingName: String = ""
    init(ingCount: Int, ingName: String) {
        self.ingCount = ingCount
        self.ingName = ingName
    }
    
}

#Preview {
RecipePage()
}

struct listModel: Identifiable{
    let id: String = UUID().uuidString
    let ingCount: Int
    let ingTitle: String
    let measType: String
}
