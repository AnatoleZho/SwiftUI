//
//  NotificationController.swift
//  WatchLandmarks Extension
//
//  Created by AnatoleZhou on 2019/10/16.
//  Copyright © 2019 AnatoleZhou. All rights reserved.
//

import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {

    var landmark: Landmark?
    var title: String?
    var message: String?
    
    let landmarkIndexKey = "landmarkIndex"
    
    override var body: NotificationView {
        NotificationView(title: title, message: message, landmark: landmark)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func didReceive(_ notification: UNNotification) {
        // This method is called when a notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        
        let userData = UserData()
        let notificatinData = notification.request.content.userInfo as? [String: Any]
        let aps = notificatinData?["aps"] as? [String: Any]
        let alert = aps?["alert"] as? [String: Any]
        
        title = alert?["title"] as? String
        message = alert?["body"] as? String
        
        if let index = notificatinData?[landmarkIndexKey] as? Int {
            landmark = userData.landmarks[index]
        }
    
    }
}
