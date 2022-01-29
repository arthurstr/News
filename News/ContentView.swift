//
//  ContentView.swift
//  News
//
//  Created by Arthur 😇 on 6.01.22.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        if currentPage < 4 {
        WalkthroughScreen()
        } else {
        TabView {
            NewsTabView()
                .tabItem{
                    Label(NSLocalizedString("News",comment: ""),systemImage: "newspaper")
                }
            SearchTabView()
                .tabItem{
                    Label(NSLocalizedString("Search",comment: ""),systemImage: "text.magnifyingglass")
                }
            
            BookmarkTabView()
                .tabItem {
                    Label(NSLocalizedString("Saved",comment: ""),systemImage: "bookmark")
                }
            SettingsView()
                .tabItem {
                    Label(NSLocalizedString("Settings",comment: ""),systemImage: "gearshape")
                }
        }
        }
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
