//
//  ingList.swift
//  Recipe App
//
//  Created by Bayan Alshuwaier on 24/10/2024.
//

import SwiftUI

struct ingList: View {
    let item: listModel
    let ingAmount: listModel
    
    var body: some View {
        HStack {
            Text("\(ingAmount.ingCount)")
                .foregroundColor(.mainOrange)
                .font(.system(size: 20))
                .bold()
                .padding(.trailing)
            Text(item.ingTitle)
                .foregroundColor(.mainOrange)
                .font(.system(size: 20))
                .bold()
            Spacer()
            Text(item.measType)
                .foregroundColor(.white)
                .frame(width: 90, height: 30, alignment: .center)
                .background(.mainOrange)
                .cornerRadius(4)


        }
    }
}

#Preview {
    ingList(
        item: listModel(ingCount: 2, ingTitle: "Sugar", measType: "Cup"),
        ingAmount: listModel(ingCount: 2, ingTitle: "Sugar", measType: "Cup")
    )
}
