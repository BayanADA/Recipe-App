//
//  RecList.swift
//  Recipe App
//
//  Created by Bayan Alshuwaier on 28/10/2024.
//

import SwiftUI

struct RecList: View {
    let title: recModel
    var body: some View {
        ZStack{
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
            }
            VStack{
                Text(title.recTitle)
                    .font(.system(size: 24))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 5)
                Text(title.recDis)
                    .font(.system(size: 12))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 20)
            }
            .frame(height: 272, alignment: .bottomLeading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 40)
            Text("See All")
                .font(.system(size: 12))
                .bold()
                .frame(width: 414,height: 272,alignment: .bottomTrailing)
                .padding(.bottom, 20)
                .padding(.trailing, 55)
                .foregroundColor(.mainOrange)
        }
    }
}

#Preview {
    RecList(
        title: recModel(recTitle: "this is the title",recDis: "this is the discription"))
}
