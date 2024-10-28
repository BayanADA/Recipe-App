//
//  RecipePage.swift
//  Recipe App
//
//  Created by Bayan Alshuwaier on 21/10/2024.
//

import SwiftUI
import PhotosUI

struct RecipePage: View {
    @State public var titleText = ""
    @State public var descriptionText = ""
    @State var isActive : Bool = false
    @State private var ingAdd = ""
    @State var selectedItems: [PhotosPickerItem] = []
    @State var data: Data?
    @EnvironmentObject var recViewModel: RecViewModel
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
        PhotosPicker(selection: $selectedItems, maxSelectionCount: 1, matching: .images) {
            if let data = data, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 413, height: 181)
            } else {
                ZStack {
                    Rectangle()
                        .fill(Color.mainGray)
                        .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
                        .foregroundColor(.mainOrange)
                        .frame(width: 413, height: 181)
                    VStack {
                        Image(systemName: "photo.badge.plus")
                            .foregroundColor(.mainOrange)
                            .font(.system(size: 60))
                        Text("Upload Photo")
                            .font(.system(size: 22))
                            .bold()
                    }
                }
            }
        }
        .onChange(of: selectedItems) { _ in
            guard let item = selectedItems.first else { return }
            item.loadTransferable(type: Data.self) { result in
                switch result {
                case .success(let data):
                    self.data = data
                case .failure(let failure):
                    print("Error loading image: \(failure)")
                }
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
            trailing: NavigationLink("Save", destination: {
                Text("yes")
            }))
        
        VStack{
            List {
                ForEach(recViewModel.items) { item in
                    ingList(item: item, ingAmount: item)
                    
                }
                .onDelete(perform: {indexSet in
                    recViewModel.items.remove(atOffsets: indexSet)
                })
            } .padding(.top, -10)
        }}
        .padding(.top, 45)
        
        if isActive{
            Ingrediants(ingTitle: "Ingrediant name", measTitle: "Measurment", servTitle: "Serving", meas1: "🥄 Spoon", meas2: "🥛 Cup", servNum: 1, addButton: {}, isActive: $isActive)
            
        }
    }
}
}

    func deleteIng(indexSet: IndexSet){
        recViewModel.items.remove(atOffsets: indexSet)}
 
 }

class ingAdding {
    var ingCount: Int = 0
    var ingName: String = ""
    init(ingCount: Int, ingName: String) {
        self.ingCount = ingCount
        self.ingName = ingName
    }
    
}

struct RecipePage_Previews: PreviewProvider {
    static var previews: some View {
        RecipePage()
            .environmentObject(RecViewModel())
    }
}

struct listModel: Identifiable, Codable {
    var id: String = UUID().uuidString
    let ingCount: Int
    let ingTitle: String
    let measType: String
}
