//
//  Feedview.swift
//  Instagram
//
//  Created by Ahanaf Tahmid Rifat on 19/11/24.
//

import SwiftUI

struct Feedview: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(0 ... 10, id: \.self){ post in
                        FeedCell()
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
