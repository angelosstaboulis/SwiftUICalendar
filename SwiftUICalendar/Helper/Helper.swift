//
//  Helper.swift
//  SwiftUICalendar
//
//  Created by Angelos Staboulis on 6/4/24.
//

import Foundation
class Helper{
    static let shared = Helper()
    private init(){}
    func createArray()->[Int]{
        var days:[Int] = []
        for item in 0..<getLastDay(){
            days.append(item+1)
        }
        return days
    }
    func getDateCurrent()->String{
        var dateCurrent:String
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E dd-MMMM-yyyy"
        dateCurrent = dateFormatter.string(from: Date())
        return dateCurrent
    }
    func createSelectedDay()->Int{
        return Calendar.current.component(.day, from: Date())
    }
    func getLastDay()->Int{
        return Calendar.current.range(of: .day, in: .month, for: Date())!.upperBound - 1
    }
}
