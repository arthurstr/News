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
                .onAppear {
                    async {
                        await articleNewsVM.loadArticles()
                    }
                }
                .navigationTitle(articleNewsVM.selectedCategory.text)
        }
    }
    
    @ViewBuilder
    private var overlayView: some View {
        
        switch articleNewsVM.phase {
        case .empty:
            ProgressView()
        case .success(let articles) where articles.isEmpty:
            EmptyPlaceHolderView(text: "No Articles",image: nil)
        case .failure(let error):
            RetryView(text:  error.localizedDescription) {
            //todo refresh the news API
        }
            
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
}



struct NewsTabView_Previews: PreviewProvider {
    static var previews: some View {
        NewsTabView(articleNewsVM: ArticleNewsViewModel(articles: Article.previewData))
    }
}
