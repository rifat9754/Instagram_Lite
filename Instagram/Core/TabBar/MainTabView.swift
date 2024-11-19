//
//  MainTabView.swift
//  Instagram
//
//  Created by Ahanaf Tahmid Rifat on 19/11/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            Feedview()
                .tabItem {
                    Image( systemName: "house")
                }
            
            Text("Search")
                .tabItem {
                    Image( systemName: "magnifyingglass")
                }
            
            Text("Upload Post")
                .tabItem {
                    Image( systemName: "plus.square")
                }
            
            Text("Notification")
                .tabItem {
                    Image( systemName: "heart")
                }
            
            ProfileView()
                .tabItem {
                    Image( systemName: "person")
                }
        }
        .accentColor(.black)
    }
}

#Preview {
    MainTabView()
}
