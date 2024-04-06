//
//  NameDayModel.swift
//  SwiftCalendar
//
//  Created by Angelos Staboulis on 3/11/23.
//

import Foundation
struct NameDayModel:Codable{
    var day:Int
    var month:Int
    var nameday:[String:String]
    enum CodingKeys:String,CodingKey{
        case day
        case month
        case nameday
    }
    init(day: Int, month: Int, nameday: [String:String]) {
        self.day = day
        self.month = month
        self.nameday = nameday
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.day, forKey: .day)
        try container.encode(self.month, forKey: .month)
        try container.encode(self.nameday, forKey: .nameday)
    }
 
}
