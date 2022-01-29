//
//  LocalNotificationNews.swift
//  News
//
//  Created by Arthur 😇 on 28.01.22.
//

import SwiftUI
import UserNotifications

@MainActor
class NotificationManager: ObservableObject {
    static let instance = NotificationManager()
    static let shared = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert,.sound,.badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options){(success,error) in
            if let error = error {
                print("ERROR:\(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification(){
        let content = UNMutableNotificationContent()
        content.title = "Hey"
        content.subtitle = "Check the news for today"
        content.sound = .default
        content.badge = 1
        
        //time
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        //calendar
        var dateComponentsMorning = DateComponents()
        dateComponentsMorning.hour = 9
        dateComponentsMorning.minute = 5
        
        let triggerMorning = UNCalendarNotificationTrigger(dateMatching: dateComponentsMorning, repeats: true)
        
        let requestMorning = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: triggerMorning)
        UNUserNotificationCenter.current().add(requestMorning)
        
    }
    
    func cancelNotification(){
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct LocalNotificationNews: View {
    var body: some View {
        VStack(spacing: 30) {
            Button("request permission"){
                NotificationManager.instance.requestAuthorization()
            }
            Button("Schedule notification"){
                NotificationManager.instance.scheduleNotification()
            }
        }
        
    }
}

struct LocalNotificationNews_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationNews()
    }
}
