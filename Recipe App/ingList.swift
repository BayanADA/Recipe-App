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
        
        HStack{
          
            Text("\(ingAmount.ingCount)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
            
            Text(item.ingTitle)
            
        }
    }
}

#Preview {
   
}
