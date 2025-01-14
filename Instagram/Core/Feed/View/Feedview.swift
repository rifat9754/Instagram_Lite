//
//  Feedview.swift
//  Instagram
//
//  Created by Ahanaf Tahmid Rifat on 19/11/24.
//

import SwiftUI

struct Feedview: View {
    @StateObject var viewModel = FeedViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(viewModel.posts){ post in
                        FeedCell( post: post)
                    }
                }
                .padding(.top, 8)
            }
            .navigationTitle("Feed")
            //.fontWeight(.bold)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Text("Instagram")
                        .fontWeight(.bold)
                    //Image("instagram-black")
                        //.resizable()
                        
                        
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                        
                        
                }
            }
        }
    }
}

#Preview {
    Feedview()
}
