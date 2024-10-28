//
//  EditView.swift
//  Recipe App
//
//  Created by Bayan Alshuwaier on 28/10/2024.
//

import SwiftUI

struct EditView: View {
@EnvironmentObject var recViewModel: RecViewModel
let title: recModel
var body: some View {
    NavigationStack{
            VStack{
                Image("testImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 272)
                    .clipped()
                    .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear, Color.black.opacity(0.9)]),
                            startPoint: .top,
                            endPoint: .bottom))
                    .padding(.bottom, 20)
                Text(title.recDis)
                    .font(.system(size: 12))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 36)
                    .padding(.leading)
                Text("Ingrediants")
                    .font(.system(size: 24))
                    .bold()
                    .frame(width: 370.5, height: 29, alignment: .leading)
                
                VStack{
                    List {
                        ForEach(recViewModel.items) { item in
                            ingList(item: item, ingAmount: item)}}
                }

            }
        Spacer()
        ZStack{
        Rectangle()
            .frame(width: 387, height: 52)
            .foregroundColor(.thirdGray)
            .cornerRadius(8)
        Text("Delete Recipe")
            .foregroundColor(.darkRed)
        .font(.system(size:22))}
        .frame(width: 414, alignment: .bottom)
        .padding()
            .navigationTitle(title.recTitle)
            .navigationBarItems(
                trailing: EditButton()
                    )
            .foregroundColor(.mainOrange)
        }
    }
}

#Preview {
EditView(
    title: recModel(recTitle: "this is the title", recDis: "this is the description")
)
.environmentObject(RecViewModel())
}
