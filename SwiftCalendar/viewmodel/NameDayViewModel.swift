//
//  NameDayViewModel.swift
//  SwiftCalendar
//
//  Created by Angelos Staboulis on 3/11/23.
//

import Foundation
import Alamofire
import SwiftyJSON
class NameDayViewModel{
    static let shared = NameDayViewModel()
    private init(){}
    func getNameDayModel() async -> NameDayModel{
        return await withCheckedContinuation { checked in
            do{
                let urlMain = URL(string: "https://nameday.abalin.net/api/V1/today")
                let request = try URLRequest(url: urlMain!, method: .post)
                AF.request(request).responseData { dataResponse in
                    do{
                        let json = try JSONDecoder().decode(NameDayModel.self, from: dataResponse.data!)
                        let day = json.day
                        let month = json.month
                        let nameday = json.nameday
                        let nameDayModel = NameDayModel(day: day, month: month, nameday: nameday)
                        checked.resume(returning: nameDayModel)
                    }
                    catch{
                        debugPrint("something went wrong!!!!!!!",error.localizedDescription)
                    }
                }
            }catch{
                debugPrint("something went wrong!!!!!!!")
            }
        }
    }
}
