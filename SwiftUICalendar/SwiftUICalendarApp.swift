//
//  SwiftUICalendarApp.swift
//  SwiftUICalendar
//
//  Created by Angelos Staboulis on 6/4/24.
//

import SwiftUI

@main
struct SwiftUICalendarApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(selectedDay: 0, lastDay: 0, dateCurrent: "")
        }
    }
}
