//
//  NewsAPIResponse.swift
//  News
//
//  Created by Arthur 😇 on 6.01.22.
//

import Foundation

struct NewsAPIResponse: Decodable {
    let status: String
    let totalResults: Int?
    let articles: [Article]?
    
    let code: String?
    let message: String?
}
