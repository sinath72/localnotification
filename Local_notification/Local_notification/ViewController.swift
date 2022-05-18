//
//  ViewController.swift
//  Local_notification
//
//  Created by Sina Taherkhani on 6/23/1400 AP.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let manager = LocalNotifManager()
        manager.notifications = [notification(id: "remind-1", title: "remmember", subtitle: "loop", datetime: DateComponents(calendar: .current, year: 2021, month: 9, day: 15, hour: 00, minute: 50))]
        manager.schedule()
    }


}

