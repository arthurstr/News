//
//  WalkthroughScreen.swift
//  News
//
//  Created by Arthur 😇 on 24.01.22.
//

import SwiftUI

struct WalkthroughScreen: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        
        
        ZStack{
            
            if currentPage == 1{
            ScreenView(image: "NewsApp",title: "Step 1",detail: "Here you will find articles collected from 100+ sources",bgcolor: Color("Color-1"))
                    .transition(.scale)
            }
            
            if currentPage == 2{
            ScreenView(image: "WorldNews",title: "Step 2",detail: "You can choose news from different parts of our planet",bgcolor: Color("Color-2"))
                    .transition(.scale)
            }
            
            if currentPage == 3{
            ScreenView(image: "ShareNews",title: "Step 3",detail: "And also share them with your friends",bgcolor: Color.white)
                    .transition(.scale)
            }
            
                    }
        .overlay(
            Button(action: {
                withAnimation(.easeInOut){
                    if currentPage < 3 {
                        currentPage += 1
                    } else {
                        currentPage = 1
                    }
                }
            }, label: {
                
                Image(systemName: "arrowtriangle.right")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 60, height: 60)
                    .background(Color.white)
                    .clipShape(Circle())
                
                    .overlay(
                    
                        ZStack{
                            
                            Circle()
                                .stroke(Color.black.opacity(0.04),lineWidth: 4)
                            
                            Circle()
                                .trim(from: 0 ,to: CGFloat(currentPage) / 3)
                                .stroke(Color.black,lineWidth: 4)
                                .rotationEffect(.init(degrees: -90))
                        }
                            .padding(-15)
                    )
            })
                .padding(.bottom,40)
            
            , alignment: .bottom
        )
        
        
    }
}

struct WalkthroughScreen_Previews: PreviewProvider {
    static var previews: some View {
        WalkthroughScreen()
    }
}
