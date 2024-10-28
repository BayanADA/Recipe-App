//
//  RecViewModel.swift
//  Recipe App
//
//  Created by Bayan Alshuwaier on 27/10/2024.
//

import Foundation

class RecViewModel: ObservableObject {
    @Published var recItems: [recModel] = [] {
    didSet {saveRec()}}
    @Published var items: [listModel] = [] {
    didSet {saveItems()}}
    let itemskey : String = "items_list"
    let recipekey : String = "recipe_list"
    
    init() {
        getIng()
        getRec()
    }
    
    func getIng() {
        guard let data = UserDefaults.standard.data(forKey: itemskey) else { return }
        guard (try? JSONDecoder().decode([listModel].self, from: data)) != nil else { return }
        let newIng = [
            listModel(ingCount: 1, ingTitle: "String", measType: "String"),
            listModel(ingCount: 1, ingTitle: "String", measType: "String")]
        items.append(contentsOf: newIng)
    }
    func addIng(title: String, ingCount: Int, measType: String) {
        let newIng = listModel(ingCount: ingCount, ingTitle: title, measType: measType)
        items.append(newIng)
        saveItems()
    }
    
    func saveItems() {
        if let encodeddata = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(encodeddata, forKey: itemskey)
        }
    }
    func getRec() {
        guard let data = UserDefaults.standard.data(forKey: recipekey) else { return }
        guard (try? JSONDecoder().decode([recModel].self, from: data)) != nil else { return }
//                let newRec = [
//                    recModel(recTitle: "String", recDis: "String"),
//                    recModel(recTitle: "String", recDis: "String")]
//        recItems.append(contentsOf: newRec)
    }
    func addRec(recTitle: String, recDis: String) {
        let newRec = recModel(recTitle: recTitle, recDis: recDis)
        recItems.append(newRec)
        saveRec()
    }
    
    func saveRec() {
        if let encodeddata = try? JSONEncoder().encode(recItems) {
            UserDefaults.standard.setValue(encodeddata, forKey: recipekey)
        }
    }
}




