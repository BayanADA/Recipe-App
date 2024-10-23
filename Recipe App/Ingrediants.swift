//
//  Ingrediants.swift
//  Recipe App
//
//  Created by Bayan Alshuwaier on 22/10/2024.
//

import SwiftUI


struct Ingrediants: View {
    let ingTitle : String
    let measTitle: String
    let servTitle: String
    @State public var ingName = ""
    let meas1: String
    let meas1Button: () -> ()
    let meas2: String
    let meas2Button: () -> ()
    let servNum: Int
    let addButton: () -> ()
    @State var ingStepper = 1
    @State private var offset: CGFloat = 1000
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
                .frame(width: 241, height: 39, alignment: .leading)
                .bold()
            HStack{
                Button {
                    meas1Button()
                }  label: {
                    ZStack{
                        Rectangle()
                            .frame(width: 104, height: 31)
                            .foregroundColor(.mainOrange)
                            .cornerRadius(8)
                        Text(meas1)
                            .foregroundColor(.white)
                        .font(.system(size:14))}
                }
                Button {
                    meas2Button()
                }  label: {ZStack{
                    Rectangle()
                        .frame(width: 104, height: 31)
                        .foregroundColor(.mainOrange)
                        .cornerRadius(8)
                    Text(meas2)
                        .foregroundColor(.white)
                        .font(.system(size:14))
                }}
            }
            .frame(width: 241, height: 8, alignment: .leading)
            .padding(.bottom, 27)
            
            Text(servTitle)
                .font(.system(size: 20))
                .frame(width: 241, height: 10, alignment: .leading)
                .bold()
            ZStack{
                Rectangle()
                    .frame(width: 145, height: 36)
                    .foregroundColor(.mainOrange)
                    .cornerRadius(4)
                
                    .frame(width: 220,alignment: .trailing)
                HStack{
                    Button{
                        if ingStepper == 1{}
                        else{
                            ingStepper = ingStepper - 1}
                    } label:{ Image(systemName: "minus")
                            .foregroundColor(.mainOrange)
                            .bold()
                            .frame(width: 27, height: 23)
                            .border(Color.mainOrange)
                        .cornerRadius(4)}
                    Text("\(ingStepper)")
                        .frame(width: 241, height: 36, alignment: .leading)
                        .font(.system(size: 20))
                }
                .padding(5)
                VStack{ Button{
                    if ingStepper == 15{}
                    else{
                        ingStepper = ingStepper + 1}
                } label:{ Image(systemName: "plus")
                        .foregroundColor(.mainOrange)
                        .bold()
                        .frame(width: 27, height: 23)
                        .border(Color.mainOrange)
                    .cornerRadius(4)}}
                .frame(width: 165, height: 39, alignment: .leading)
            }
            .frame(width: 241, height: 36, alignment: .leading)
            .background(Color.thirdGray)
            .padding(.bottom, 37)
            .cornerRadius(4)
            
            
            HStack{
                Button {
                    close()
                }  label: {
                    ZStack{
                        Rectangle()
                            .frame(width: 134, height: 36)
                            .foregroundColor(.thirdGray)
                            .cornerRadius(8)
                        Text("Cancel")
                            .foregroundColor(.darkRed)
                        .font(.system(size:20))}}
                Button {
                    addButton()
                }  label: {ZStack{
                    Rectangle()
                        .frame(width: 134, height: 36)
                        .foregroundColor(.mainOrange)
                        .cornerRadius(8)
                    Text("Add")
                        .foregroundColor(.white)
                    .font(.system(size:20))}
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
        .offset(x:0, y:offset)
        .onAppear{
            withAnimation(.spring()){
            offset = 0
        }}
    }
     
    func close() {
        withAnimation(.spring()){
            offset = 1000
        }
    }
}

#Preview {
    Ingrediants(ingTitle: "Ingrediant name", measTitle: "Measurment", servTitle: "Serving", meas1: "🥄 Spoon", meas1Button: {}, meas2: "🥛 Cup", meas2Button: {}, servNum: 1, addButton: {})
}
