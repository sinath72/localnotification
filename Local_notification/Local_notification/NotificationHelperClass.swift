//
//  NotificationHelperClass.swift
//  Local_notification
//
//  Created by Sina Taherkhani on 6/23/1400 AP.
//

import Foundation
import UserNotifications
struct notification {
    var id:String
    var title:String
    var subtitle:String
    var datetime:DateComponents
}
class LocalNotifManager {
    var notifications = [notification]()
    func listSchedulednotification() {
        UNUserNotificationCenter.current()
            .getPendingNotificationRequests{notifications in
                for notification in notifications{
                    print(notification)
                }
            }
    }
    private func requestAuthorization(){
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert,.badge,.sound]){granted,error in
                if (granted == true && error == nil){
                    self.scheduleNotifications()
                }
            }
    }
    func schedule() {
        UNUserNotificationCenter.current().getNotificationSettings {settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                self.requestAuthorization()
            case .authorized, .provisional:
                self.scheduleNotifications()
            default:
                break
            }
        }
    }
    private func scheduleNotifications(){
        for notificatioon in notifications {
            let content = UNMutableNotificationContent()
            content.title = notificatioon.title
            content.subtitle = notificatioon.subtitle
            content.sound = .default
            let trigger = UNCalendarNotificationTrigger(dateMatching: notificatioon.datetime, repeats: false)
            let request = UNNotificationRequest(identifier: notificatioon.id, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request) {
                error in
                guard error == nil else {return}
                print("notif id ----->\(notificatioon.id)")
            }
            
        }
    }
}
