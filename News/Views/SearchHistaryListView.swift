//
//  SearchHistaryListView.swift
//  News
//
//  Created by Arthur 😇 on 14.01.22.
//

import SwiftUI

struct SearchHistaryListView: View {
    
    @ObservedObject var searchVM: ArticleSearchViewModel
    let onSubmit: (String) -> ()
    
    var body: some View {
        List {
            HStack {
                Text(NSLocalizedString("Recently Searched",comment: ""))
                Spacer()
                Button(NSLocalizedString("Clear",comment: "")){
                    searchVM.removeAllHistory()
                }
                .foregroundColor(.accentColor)
            }
            .listRowSeparator(.hidden)
            
            ForEach(searchVM.history,id: \.self) { history in
                Button(history){
                    onSubmit(history)
                }
                .swipeActions{
                    Button(role: .destructive){
                        searchVM.removeHistory(history)
                    } label: {
                        Label(NSLocalizedString("Delete",comment: ""),systemImage: "trash")
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}

struct SearchHistaryListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchHistaryListView(searchVM: ArticleSearchViewModel.shared){_ in
            
        }
    }
}
