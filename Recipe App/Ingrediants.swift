//
//  Ingrediants.swift
//  Recipe App
//
//  Created by Bayan Alshuwaier on 22/10/2024.
//

import SwiftUI


//ingTitle
//measTitle
//servTitle
//ingName state
//measurment
//serving

struct Ingrediants: View {
    let ingTitle : String
    let measTitle: String
    let servTitle: String
    @State public var ingName = ""
    let meas1: String
    let meas2: String
    let servNum: Int
    let action: () -> ()
    var body: some View {
        VStack{
            Text(ingTitle)
                .font(.system(size: 20))
                .frame(width: 275, height: 18, alignment: .leading)
                .bold()
            TextField("Ingrediant name", text: $ingName)
                .font(.system(size: 14))
                .padding()
                .frame(width: 275, height: 39)
                .background(Color.thirdGray)
                .cornerRadius(8)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 15)
            
            Text(measTitle)
                .font(.system(size: 20))
                .frame(width: 275, height: 39, alignment: .leading)
                .bold()
            HStack{
                ZStack{
                    Rectangle()
                        .frame(width: 104, height: 31)
                        .foregroundColor(.mainOrange)
                        .cornerRadius(8)
                    Text(meas1)
                        .foregroundColor(.white)
                        .font(.system(size:14))
                }
                ZStack{
                    Rectangle()
                        .frame(width: 104, height: 31)
                        .foregroundColor(.mainOrange)
                        .cornerRadius(8)
                    Text(meas2)
                        .foregroundColor(.white)
                        .font(.system(size:14))
                }
            }
            .frame(width: 275, height: 8, alignment: .leading)
            .padding(.bottom, 27)
            
            Text(servTitle)
                .font(.system(size: 20))
                .frame(width: 275, height: 10, alignment: .leading)
                .bold()
            ZStack{
                VStack{
                    Rectangle()
                        .frame(width: 241, height: 36)
                        .foregroundColor(.thirdGray)
                        .cornerRadius(8)
                }
                
                VStack{
                    Rectangle()
                        .frame(width: 145, height: 36)
                        .foregroundColor(.mainOrange)
                        .cornerRadius(8)
                }
                .frame(width: 241,alignment: .trailing)
            }
            .frame(width: 275, height: 39, alignment: .leading)
            .padding(.bottom, 47)
            
            
            HStack{
                ZStack{
                    Rectangle()
                        .frame(width: 134, height: 36)
                        .foregroundColor(.thirdGray)
                        .cornerRadius(8)
                    Text("Cancel")
                        .foregroundColor(.darkRed)
                        .font(.system(size:20))
                }
                ZStack{
                    Rectangle()
                        .frame(width: 134, height: 36)
                        .foregroundColor(.mainOrange)
                        .cornerRadius(8)
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size:20))
                }
            }
            
            
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding()
        .padding(.top)
        .cornerRadius(8)
        .background(Color.secondGrey)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 8)
    }
     
    
}

#Preview {
    Ingrediants(ingTitle: "Ingrediant name", measTitle: "Measurment", servTitle: "Serving", meas1: "🥄 Spoon", meas2: "🥛 Cup", servNum: 1, action: {})
}
