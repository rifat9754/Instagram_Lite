//
//  FeedCell.swift
//  Instagram
//
//  Created by Ahanaf Tahmid Rifat on 20/11/24.
//
/*
import SwiftUI
import Kingfisher

struct FeedCell: View {
    let post: Post
    var body: some View {
        VStack{
            //image + username
            HStack{
                if let user = post.user {
                   Image(user.profileImageUrl ?? "")
                       .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    //CircularProfileImageView(user: user, size: .xSmall)
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                Spacer()
                
            }
            .padding(.leading, 8)
            
            //post image
            
            KFImage(URL(string: post.imageUrl))
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
            
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top, 1)
            
            
            //caption label
            
            HStack {
                Text("\(post.user?.username ?? "")").fontWeight(.semibold) +
                Text(post.caption)
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
    FeedCell(post: Post.MOCK_POSTS[0])
}

*/

//
//  FeedCell.swift
//  Instagram
//
//  Created by Ahanaf Tahmid Rifat on 20/11/24.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    let post: Post
    
    var body: some View {
        VStack {
            // User profile image + username
            HStack {
                if let user = post.user {
                    KFImage(URL(string: user.profileImageUrl ?? ""))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                Spacer()
            }
            .padding(.leading, 8)
            
            // Post image
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFit()
            
            // Action buttons
            HStack(spacing: 16) {
                Button {
                    print("Like Post")
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                
                Button {
                    print("Comment on Post")
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                
                Button {
                    print("Share Post")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                

                
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundColor(.black)
            
            // Like label
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            // Caption label
            HStack {
                Text(post.user?.username ?? "")
                    .fontWeight(.semibold) +
                Text(" \(post.caption)")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.leading, 10)
            .padding(.top, 1)
            
            // Timestamp
            Text("6h ago")
                .font(.footnote)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
        }
    }
}

#Preview {
    FeedCell(post: Post.MOCK_POSTS[0])
}
