//
//  SettingsTabView.swift
//  News
//
//  Created by Arthur 😇 on 15.01.22.
//

import SwiftUI

struct SettingsTabView: View {
    
    @State var selectedCountry = Country.us
    //let locale = Locale.current
    
    var body: some View {
        NavigationView {
        List {
                    Section(header: Text("News") ){
                        Picker("Country", selection: $selectedCountry) {
                            ForEach(Country.allCases) { country in
                                Text(country.rawValue.capitalized)
                                    .tag(country)
                            }
                        }
                        //Text(locale.regionCode ?? " ")
                    }
                    .padding()
                    
                    
                }
    }
}
}
struct SettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTabView()
    }
}
