//
//  FeedCell.swift
//  Instagram
//
//  Created by Ahanaf Tahmid Rifat on 20/11/24.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack{
            //image + username
            HStack{
                Image("batman2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                Text("Batman")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Spacer()
                
            }
            .padding(.leading, 8)
            
            //post image
            
            Image("batman2")
                .resizable()
                .scaledToFit()
                .frame(width: 400)
                .clipShape(Rectangle())
            
            //action button
            
            HStack(spacing: 16){
                Button {
                    print("Like Post")
                    
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                    
                }
                
                Button {
                    print("Comment on post")
                    
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                    
                }
                
                Button {
                    print("Share post")
                    
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                    
                }
                
                Spacer()
                
            }
            .padding(.leading,8)
            .padding(.top, 4)
            .foregroundColor(.black)
            
            
            //like label
            
            Text("23 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top, 1)
            
            
            //caption label
            
            HStack {
                Text("Batman ").fontWeight(.semibold) +
                Text("I chose this life. I know what I'm doing.If you are good, the shadow's wings are a welcome, protective blanket")
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .font(.footnote)
            .padding(.leading,10)
            .padding(.top, 1)
            
            Text("6h ago")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top, 1)
                .foregroundColor(.gray)
        }
        
    }
}

#Preview {
    FeedCell()
}
