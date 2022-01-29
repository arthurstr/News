//
//  NewsApp.swift
//  News
//
//  Created by Arthur 😇 on 6.01.22.
//

import SwiftUI

@main
struct NewsApp: App {
    
    @StateObject var articleBookmarkVM = ArticleBookmarkViewModel.shared
    @StateObject var notification = NotificationManager.shared
    
    var body: some Scene {
        WindowGroup {
    
            ContentView()
               .environmentObject(articleBookmarkVM)
               .environmentObject(notification)
        }
    }
}
