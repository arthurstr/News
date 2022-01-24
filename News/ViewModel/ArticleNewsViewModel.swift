//
//  ArticleNewsViewModel.swift
//  News
//
//  Created by Arthur 😇 on 12.01.22.
//

import SwiftUI

enum DataFetchPhase<T> {
    case empty
    case success(T)
    case failure(Error)
}

struct FetchTaskTokenCategory: Equatable {
    var category: Category
    var token: Date
}

struct FetchTaskTokenCountry: Equatable {
    var country: Country
    var token: Date
}

@MainActor
class ArticleNewsViewModel: ObservableObject {
    
    @Published var phase = DataFetchPhase<[Article]>.empty
    @Published var fetchTaskTokenCountry: FetchTaskTokenCountry
    @Published var fetchTaskTokenCategory: FetchTaskTokenCategory
    
    private let newsAPI = NewsAPI.shared
    private let locale: NSLocale = NSLocale.current as NSLocale
    private var country: String? {
        get {
            return locale.countryCode?.uppercased()
        }
    }
    
    init(articles: [Article]? = nil, selectedCategory: Category = .general,selectedCountry: Country = .ru) {
        if let articles = articles{
            self.phase = .success(articles)
        } else {
            self.phase = .empty
        }
        self.fetchTaskTokenCategory = FetchTaskTokenCategory(category: selectedCategory,token: Date())
        self.fetchTaskTokenCountry =  FetchTaskTokenCountry(country: selectedCountry,token: Date())
    }
    func loadArticles() async {
           // phase = .success(Article.previewData)
                     if Task.isCancelled {return}
            phase = .empty
            do {
                let articles = try await newsAPI.fetch(from: fetchTaskTokenCategory.category,from: fetchTaskTokenCountry.country)
                if Task.isCancelled {return}
                phase = .success(articles)
                
            } catch {
                if Task.isCancelled {return}
                phase = .failure(error)
            }
        }
    
}
