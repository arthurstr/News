//
//  Country.swift
//  News
//
//  Created by Arthur 😇 on 15.01.22.
//

import Foundation
import UIKit
import SwiftUI

enum Country: String, CaseIterable {
    case us 
    case gb
    case ru
    case ua
    case pl
    case au
    case br
    
    var text: String {
        rawValue.capitalized
    }
}


extension Country:Identifiable{
    var id: Self {self}
}
