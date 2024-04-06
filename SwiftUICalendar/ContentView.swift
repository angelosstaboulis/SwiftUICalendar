//
//  ContentView.swift
//  SwiftUICalendar
//
//  Created by Angelos Staboulis on 6/4/24.
//

import SwiftUI

struct ContentView: View {
    var vGridLayout = [
        GridItem(.fixed(60)),GridItem(.fixed(55)),GridItem(.fixed(55)),GridItem(.fixed(55)),GridItem(.fixed(55))
    ]
    var body: some View {
        VStack {
            Text("SwiftUICalendar").padding(60)
            LazyVGrid(columns:vGridLayout){
                ForEach(Helper.shared.createArray(),id:\.self){ item in
                    Text(String(describing:item)).foregroundStyle(item == Helper.shared.createSelectedDay() ? .red : .black)
                }.padding(15)
            }.padding(25)
            Text(Helper.shared.getDateCurrent())
        }
        
    }

}

#Preview {
    ContentView()
}
