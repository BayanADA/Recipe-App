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
let meas2: String
let servNum: Int
@State var ingStepper = 1
@State private var measChosen: String? = nil
@State private var offset: CGFloat = 1000
@Binding var isActive: Bool
@EnvironmentObject var recViewModel: RecViewModel
var body: some View {
ZStack{
    Color(.black)
        .opacity(0.8)
        .onTapGesture {
            close()
        }
    VStack{
        Text(ingTitle)
            .font(.system(size: 22))
            .frame(width: 275, height: 18, alignment: .leading)
            .bold()
        TextField("Ingrediant name", text: $ingName)
            .font(.system(size: 16))
            .padding()
            .frame(width: 275, height: 39)
            .background(Color.thirdGray)
            .cornerRadius(8)
            .multilineTextAlignment(.leading)
            .padding(.bottom, 15)
        
        Text(measTitle)
            .font(.system(size: 22))
            .frame(width: 241, height: 39, alignment: .leading)
            .bold()
        HStack{
            Button {
                measChosen = meas1
            }  label: {
                ZStack{
                    Rectangle()
                        .frame(width: 104, height: 31)
                        .foregroundColor(.mainOrange)
                        .cornerRadius(8)
                    Text(meas1)
                        .foregroundColor(.white)
                    .font(.system(size:16))}
            }
            Button {
                measChosen = meas2
            }  label: {ZStack{
                Rectangle()
                    .frame(width: 104, height: 31)
                    .foregroundColor(.mainOrange)
                    .cornerRadius(8)
                Text(meas2)
                    .foregroundColor(.white)
                    .font(.system(size:16))
            }}
        }
        .frame(width: 241, height: 8, alignment: .leading)
        .padding(.bottom, 27)
        
        Text(servTitle)
            .font(.system(size: 22))
            .frame(width: 241, height: 10, alignment: .leading)
            .bold()
        ZStack{
            Rectangle()
                .frame(width: 145, height: 36)
                .foregroundColor(.mainOrange)
                .cornerRadius(4)
            
                .frame(width: 220,alignment: .trailing)
            
            
            if let chosen = measChosen{
                Text(chosen)
                    .frame(width: 120, height: 10, alignment: .trailing)
                    .foregroundColor(.white)
            } else {
                Text("")}
            HStack{
            Button{
                minus()
            } label:{ Image(systemName: "minus")
                .foregroundColor(.mainOrange)
                .bold()
                .frame(width: 27, height: 23)
                .border(Color.mainOrange)
                .cornerRadius(4)}
            Text("\(ingStepper)")
            .frame(width: 241, height: 36, alignment: .leading)
            .font(.system(size: 22)) }
            .padding(9)
            VStack{ Button{
                plus()
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
                .font(.system(size:22))}}
        Button {
            addButtonPressed()
            close()
        }  label: {ZStack{
            Rectangle()
                .frame(width: 134, height: 36)
                .foregroundColor(.mainOrange)
                .cornerRadius(8)
            Text("Add")
                .foregroundColor(.white)
            .font(.system(size:22))}
        }
    }
    }
    .fixedSize(horizontal: false, vertical: true)
    .padding()
    .padding(.top)
    .background(Color.secondGrey)
    .clipShape(RoundedRectangle(cornerRadius: 20))
    .shadow(radius: 8)
    .offset(x:0, y:offset)
    .onAppear{appear()}
    }
    .ignoresSafeArea()
    }

    func close() {
    withAnimation(.spring()){
        offset = 1000
        isActive = false
    }
    }
    func minus() {
    if ingStepper == 1{}
    else{
        ingStepper = ingStepper - 1}
    }
    func plus() {
    if ingStepper == 15{}
    else{
        ingStepper = ingStepper + 1}
    }
    func appear() {
        withAnimation(.spring()){
            offset = 0}
    }
    func addButtonPressed() {
    recViewModel.addIng(title: ingName, ingCount: ingStepper, measType: measChosen ?? "")
    }
    }

    struct Ingrediants_Previews: PreviewProvider {
    static var previews: some View {
    Ingrediants(
        ingTitle: "Ingrediant name",
        measTitle: "Measurment",
        servTitle: "Serving",
        meas1: "🥄 Spoon",
        meas2: "🥛 Cup",
        servNum: 1,
        isActive: .constant(true)
    )
    .environmentObject(RecViewModel())
    }
    }
