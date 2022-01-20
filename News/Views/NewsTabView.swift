//
//  NewsTabView.swift
//  News
//
//  Created by Arthur 😇 on 12.01.22.
//

import SwiftUI

struct NewsTabView: View {
    
    @StateObject var articleNewsVM = ArticleNewsViewModel()

    
    var body: some View {
        NavigationView {
            ArticleListView(articles: articles)
                .overlay(overlayView)
                .task(id: articleNewsVM.fetchTaskTokenCategory, loadTask)
                .task(id: articleNewsVM.fetchTaskTokenCountry, loadTask)
                .refreshable(action: refreshTask)
                .navigationTitle(articleNewsVM.fetchTaskTokenCategory.category.text)
                .navigationBarItems(trailing: menu)
        }
    }
    
    @ViewBuilder
    private var overlayView: some View {
        
        switch articleNewsVM.phase {
        case .empty:
            ProgressView()
        case .success(let articles) where articles.isEmpty:
            EmptyPlaceHolderView(text: NSLocalizedString("No Articles",comment: ""),image: nil)
        case .failure(let error):
            RetryView(text:  error.localizedDescription, retryAction: refreshTask)
        default:EmptyView()
        }
    }
    
    private var articles: [Article]{
        if case let .success(articles) = articleNewsVM.phase{
            return articles
        } else {
            return []
        }
    }
    
    @Sendable private func loadTask() async {
        await articleNewsVM.loadArticles()
    }
    
    @Sendable private func refreshTask(){
        articleNewsVM.fetchTaskTokenCategory = FetchTaskTokenCategory(category: articleNewsVM.fetchTaskTokenCategory.category, token: Date())
        articleNewsVM.fetchTaskTokenCountry = FetchTaskTokenCountry(country: articleNewsVM.fetchTaskTokenCountry.country, token: Date())
    }
    private var menu: some View {
        HStack{
        Menu {
            Picker("Categpry",selection: $articleNewsVM.fetchTaskTokenCategory.category){
                ForEach(Category.allCases){
                    Text($0.text).tag($0)
                }
            }
        } label:{
            Image(systemName: "filemenu.and.selection")
                .imageScale(.large)
        }
        Menu {
            Picker("Country",selection: $articleNewsVM.fetchTaskTokenCountry.country){
                    ForEach(Country.allCases){
                        Text($0.text).tag($0)
                    }
                }
            } label:{
                Image(systemName: "globe.europe.africa")
                    .imageScale(.large)
            }
        }
    }
}



struct NewsTabView_Previews: PreviewProvider {
    
    @StateObject static var articleBookmarkVM = ArticleBookmarkViewModel.shared
    
    static var previews: some View {
        NewsTabView(articleNewsVM: ArticleNewsViewModel(articles: Article.previewData))
            .environmentObject(articleBookmarkVM)
    }
}
