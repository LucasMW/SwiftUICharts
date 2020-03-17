//
//  ContentView.swift
//  ChartSwiftUIWatch WatchKit Extension
//
//  Created by Lucas Menezes on 3/16/20.
//  Copyright © 2020 Lucas Menezes. All rights reserved.
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
                    .font(.system(size:14))
                    .fontWeight(.heavy)
                
                Picker(selection: $pickerSelectedItem, label: Text("graph by")) {
                    Text("Weekday").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                }
                    .padding(.horizontal,24)
                
                HStack(spacing: 10){
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
                Capsule().frame(width: 10, height: 50).foregroundColor(.black)
                Capsule().frame(width: 10, height: value/4).foregroundColor(.white)
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
