//
//  ContentView.swift
//  Recipe App
//
//  Created by Bayan Alshuwaier on 20/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State var ingStepperr = 1
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            HStack{
                Button{
                    if ingStepperr == 1{}
                    else{
                        ingStepperr = ingStepperr - 1
                    }
                } label:{ Image(systemName: "minus")
                                }
             
                Text("\(ingStepperr)")
                .frame(width: 241, height: 36, alignment: .leading)
                Button{
                    if ingStepperr == 10{}
                    else{
                        ingStepperr = ingStepperr + 1
                    }
                } label:{ Image(systemName: "plus")
                        .foregroundColor(.mainOrange)
                                }
            }
            HStack{
                Rectangle()
                    .frame(width: 145, height: 36)
                    .foregroundColor(.mainOrange)
                    .cornerRadius(8)
            }
            
            .frame(width: 241,alignment: .trailing)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
