//
//  localPushManager.swift
//  localPushNotification_Demo
//
//  Created by Ayaan Ruhi on 10/10/18.
//  Copyright © 2018 parth. All rights reserved.
//

import Foundation
import UserNotifications

class LocalPushManager {
    static var shared = LocalPushManager()
    let center = UNUserNotificationCenter.current()
    
    func requestAuthorization() {
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            if error == nil {
                print("User allow us to send notification")
            }
        }
    }
    
    func sendNotification(in time:TimeInterval) {
        
        //MARK: Create Notification content
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "Time is over", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "Please stop your task", arguments: nil)
        
        //MARK: Trigger Notification
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
        let request = UNNotificationRequest(identifier: "Timer", content: content, trigger: trigger)
        
        center.add(request) { (error) in
            if error == nil {
                print("Completed Notification Demo")
            }
        }
    }
}
