//
//  SettingsView.swift
//  News
//
//  Created by Arthur 😇 on 29.01.22.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("permissionNotification") var permissionNotification = false
        
        var body: some View {
            NavigationView {
            List {
                        Section(header: Text("Notification") ){
                            VStack {
                                Toggle("Permission notification", isOn: $permissionNotification)
                                    .onTapGesture {
                                        if !permissionNotification {
                                            NotificationManager.instance.requestAuthorization()
                                            NotificationManager.instance.scheduleNotification()
                                        } else {
                                            NotificationManager.instance.cancelNotification()
                                        }
                                }
                                    
                                    }
                            .onAppear(){
                                UIApplication.shared.applicationIconBadgeNumber = 0
                            }
                        }
                        .padding()
        }
    }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
