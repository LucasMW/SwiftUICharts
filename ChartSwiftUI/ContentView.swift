//
//  ContentView.swift
//  ChartsUI
//
//  Created by Lucas Sousa on 16/03/2020.
//  Copyright © 2020 Lucas Sousa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let color = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
    let bgColor = Color.purple
    
    @State var pickerSelectedItem = 0
    @State var dataPoints: [[CGFloat]] = [
    [50,100,150,180,130,80,25],
    [150,120,150,200,120,10,25],
    [30,100,15,20,130,15,25]
    ]
    var body: some View {
        ZStack{
            bgColor.edgesIgnoringSafeArea(.all)
            VStack{
                Text("Calory Intake")
                    .font(.system(size:34))
                    .fontWeight(.heavy)
                
                Picker(selection: $pickerSelectedItem, label: Text("xxx")) {
                    Text("Weekday").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal,24)
                
                HStack(spacing: 16){
                    Barview(value: dataPoints[pickerSelectedItem][0])
                    Barview(value: dataPoints[pickerSelectedItem][1], text: "M")
                    Barview(value: dataPoints[pickerSelectedItem][2],text: "T")
                    Barview(value: dataPoints[pickerSelectedItem][3],text: "W")
                    Barview(value: dataPoints[pickerSelectedItem][4],text: "T")
                    Barview(value: dataPoints[pickerSelectedItem][5],text: "F")
                    Barview(value: dataPoints[pickerSelectedItem][6],text: "S")
                }.animation(.default)
            }
        }
    }
}
struct Barview: View {
    var value: CGFloat = 0
    var text: String = "D"
    var body: some View {
        VStack{
            ZStack (alignment: .bottom){
                Capsule().frame(width: 30, height: 200)
                Capsule().frame(width: 30, height: value).foregroundColor(.white)
            }
            Text(text).padding(.top,8)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
