//
//  ContentView.swift
//  SwiftUICalendar
//
//  Created by Angelos Staboulis on 6/4/24.
//

import SwiftUI

struct ContentView: View {
    @State var days:[Int]=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]
    var vGridLayout = [
        GridItem(.fixed(60)),GridItem(.fixed(60)),GridItem(.fixed(60)),GridItem(.fixed(60)),GridItem(.fixed(60))
    ]
    @State var selectedDay:Int
    @State var lastDay = 0
    @State var dateCurrent:String
    var body: some View {
        VStack {
            Text("SwiftUICalendar").padding(60)
            LazyVGrid(columns:vGridLayout){
                ForEach(days,id:\.self){ item in
                    if item <= lastDay{
                        Text(String(describing:item)).foregroundStyle(item == selectedDay ? .red : .black)
                    }else{
                        Text(String(describing:item)).foregroundStyle(item == lastDay ? .clear : .clear)
                    }
                }.padding(15)
                    .onAppear(perform: {
                        selectedDay = Calendar.current.component(.day, from: Date())
                        if let calculatelastDay = Calendar.current.range(of: .day, in: .month, for: Date()){
                            lastDay = calculatelastDay.upperBound - 1
                        }
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "E dd-MMMM-yyyy"
                        dateCurrent = dateFormatter.string(from: Date())
                        
                    })
                
                    
            }
            Text(dateCurrent)
        }
        
    }
}

#Preview {
    ContentView(selectedDay: 0, lastDay: 0, dateCurrent: "")
}
