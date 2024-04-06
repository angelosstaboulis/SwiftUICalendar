//
//  ViewController.swift
//  SwiftCalendar
//
//  Created by Angelos Staboulis on 3/11/23.
//

import UIKit
import Alamofire
import SwiftyJSON
class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lblTimeZone: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblNameDay: UILabel!
    var helper = Helper()
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
   
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: 2000, height: 0)
    }

}
extension ViewController{
    func createView(){
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] (timer) in
            self!.lblTime.text = SwiftCalendarTimer.shared.getTime()
        }
        Task.init{
            lblDate.text = await helper.getDate()
            lblTimeZone.text = await helper.getTimeZone()
            lblNameDay.text = await helper.getNameDay()
        }
  

    }
}
