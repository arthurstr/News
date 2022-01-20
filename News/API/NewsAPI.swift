//
//  NewsAPI.swift
//  News
//
//  Created by Arthur 😇 on 12.01.22.
//

import Foundation

struct NewsAPI {
    
    static let shared = NewsAPI()
    private init(){
    }
    
    private let apiKey = "a56fc5fe0c1948e4aee78a842755c100"
    private let session = URLSession.shared
    private let jsonDecoder: JSONDecoder = {
       let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    func fetch (from category: Category,from country: Country) async throws -> [Article] {
        try await fetchArticles(from: generateNewsURL(from: category,from: country))
        
    }
    
    func search(for query: String) async throws -> [Article]{
        try await fetchArticles(from: generateSearchURL(from: query  ))
    }
    
    private func fetchArticles (from url: URL) async throws -> [Article] {
        let (data, response) = try await session.data(from: url)
        
        guard let response = response as? HTTPURLResponse else{
            throw generateError(description: "Bad response")
        }
        
        switch response.statusCode {
            
        case (200...299), (400...499):
            let apiResponse = try jsonDecoder.decode(NewsAPIResponse.self, from: data)
            if apiResponse.status == "ok" {
                return apiResponse.articles ?? []
            } else {
                throw generateError(description: apiResponse.message ?? "An error occured")
            }
            
        default:
            throw generateError(description: "A server error occured")
        }
    }
    
    private func generateError(code: Int = 1, description: String) -> Error {
        NSError(domain:"NewsAPI",code: code,userInfo: [NSLocalizedDescriptionKey: description])
    }
    
    private func generateSearchURL(from query: String) -> URL {
        let percentEncodedString = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
        
        var url = "https://newsapi.org/v2/everything?"
        url += "apiKey=\(apiKey)"
        url += "&language=\(NSLocalizedString("en",comment: ""))"
        url += "&q=\(percentEncodedString)"
        return URL(string: url)!
    }
    
    private func generateNewsURL(from category: Category,from country: Country) -> URL {
        var url = "https://newsapi.org/v2/top-headlines?"
        url += "apiKey=\(apiKey)"
        //url += "&language=\(NSLocalizedString("ua",comment: ""))"
        url += "&country=\(country.rawValue)"
        url += "&category=\(category.rawValue)"
        return URL(string: url)!
    }
}
