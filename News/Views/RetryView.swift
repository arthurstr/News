//
//  RetryView.swift
//  News
//
//  Created by Arthur 😇 on 12.01.22.
//

import SwiftUI

struct RetryView: View {
    
    let text: String
    let retryAction: () -> ()
    
    var body: some View {
        VStack(spacing: 8) {
            Text(text)
                .font(.callout)
                .multilineTextAlignment(.center)
            
            Button (action: retryAction ){
                Text(NSLocalizedString("Try again",comment: ""))
            }
        }
    }
}

struct RetryView_Previews: PreviewProvider {
    static var previews: some View {
        RetryView(text: NSLocalizedString("An error ocurred",comment: "")) {
            
        }
    }
}
