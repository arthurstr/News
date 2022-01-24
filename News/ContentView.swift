//
//  ContentView.swift
//  News
//
//  Created by Arthur 😇 on 6.01.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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
            SettingsTabView()
                .tabItem {
                    Label(NSLocalizedString("Settings",comment: ""),systemImage: "gearshape")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
