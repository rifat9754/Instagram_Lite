//
//  MainTabView.swift
//  Instagram
//
//  Created by Ahanaf Tahmid Rifat on 19/11/24.
//

import SwiftUI

struct MainTabView: View {
    let user: User
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView(selection: $selectedIndex){
            Feedview()
                .onAppear() {
                    selectedIndex = 0
                }
                .tabItem {
                    Image( systemName: "house")
                }.tag(0)
            
            SearchView()
                .onAppear() {
                    selectedIndex = 1
                }
                .tabItem {
                    Image( systemName: "magnifyingglass")
                }.tag(1)
            
            UploadPostView( tabIndex: $selectedIndex)
                .onAppear() {
                    selectedIndex = 2
                }
                .tabItem {
                    Image( systemName: "plus.square")
                }.tag(2)
            
            CurrentUserProfileView(user: user)
                .onAppear() {
                    selectedIndex = 3
                }
                .tabItem {
                    Image( systemName: "person")
                }.tag(3)
            
            ShopView()
                .onAppear {
                    selectedIndex = 4
                }
                .tabItem {
                    Image(systemName: "cart")
                    Text("Shop")
                }
                .tag(4)

            

        }
        .accentColor(.black)
    }
}

#Preview {
    MainTabView(user: User.MOCK_USERS[0])
}
