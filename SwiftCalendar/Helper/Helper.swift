//
//  Helper.swift
//  SwiftCalendar
//
//  Created by Angelos Staboulis on 3/11/23.
//

import Foundation
import UIKit
actor Helper{
    func getDate() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE dd/MM/yyyy"
        return formatter.string(from: Date())
    }

    func getTimeZone()->String{
        let formatter = DateFormatter()
        return formatter.timeZone.identifier
    }
    func getNameDay() async -> String{
        return await withCheckedContinuation { checked in
            Task.init{
                let nameDay = await NameDayViewModel.shared.getNameDayModel().nameday
                let nameDayArray = nameDay["us"]!.components(separatedBy: ",")
                if nameDayArray.count > 1 {
                    var newArray:String!=""
                    for item in 0..<nameDayArray.count{
                        newArray = newArray + nameDayArray[item]
                    }
                    checked.resume(returning:newArray)
                }else{
                    checked.resume(returning:nameDayArray[0])
                    
                }
            }
        }
    }
   
}
class SwiftCalendarTimer{
    static let shared = SwiftCalendarTimer()
    private init(){}
    func getTime() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        return formatter.string(from: Date())
    }
}
