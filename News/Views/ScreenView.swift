//
//  ScreenView.swift
//  News
//
//  Created by Arthur 😇 on 24.01.22.
//

import SwiftUI

struct ScreenView: View {
    
    var image: String
    var title: String
    var detail: String
    var bgcolor: Color
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        VStack(spacing: 20){
            
            HStack{
                
                if currentPage == 1{
                Text("Hello new user!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .kerning(1.4)
                } else {
                    Button(action: {
                        withAnimation(.easeInOut){
                            currentPage -= 1
                        }
                    }, label: {
                        
                        Image(systemName: "arrowtriangle.left")
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                    })
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut){
                        currentPage = 4
                    }
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                })
            }
            .foregroundColor(.black)
            .padding()
            
            Spacer()
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
              
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top)
            
            Text(detail)
                .fontWeight(.semibold)
                .kerning(1.3)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
            
            Spacer(minLength: 120)
            
        }
        .background(bgcolor.cornerRadius(10).ignoresSafeArea())

    }
}

struct ScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenView(image: "NewsApp",title: "Step 1",detail: "hi",bgcolor: Color("Color-1"))
    }
}
