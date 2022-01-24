//
//  SettingsTabView.swift
//  News
//
//  Created by Arthur 😇 on 15.01.22.
//

import SwiftUI

struct SettingsTabView: View {
    
    @State private var selectedCountry = Country.us
    @StateObject var articleNewsVM = ArticleNewsViewModel()
    
    var body: some View {
        NavigationView {
        List {
                    Section(header: Text("News") ){
                        VStack {
                            Toggle("Make articles static", isOn: $articleNewsVM.articleStatic)
                                }
                    }
                    .padding()
            if articleNewsVM.articleStatic {
                Text("true")
            } else {
                Text("false")
            }
    }
}
}
    
}
struct SettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTabView()
    }
}
