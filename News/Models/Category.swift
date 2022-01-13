//
//  Category.swift
//  News
//
//  Created by Arthur 😇 on 12.01.22.
//

import Foundation
import UIKit

enum Category: String, CaseIterable {
    case general
    case business
    case technology
    case entertainment
    case sports
    case science
    case health
    
    var text: String {
        if self == .general {
            return "Top Headlines"
        }
        return rawValue.capitalized
    }
}

extension Category:Identifiable{
    var id: Self {self}
}

