//
//  MainTabView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/03/22.
//

import SwiftUI

struct MainTabView: View {
    let user: User
    @State private var selectedIndex = 0

    var body: some View {
        TabView(selection: self.$selectedIndex) {
            // TODO: - FeedView()
            Text("Feed")
                .onAppear {
                    self.selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)

            // TODO: - SearchView()
            Text("Search")
                .onAppear {
                    self.selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)

            // TODO: - UploadPostView(tabIndex: self.$selectedIndex)
            Text("Upload Post")
                .onAppear {
                    self.selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "plus.square")
                }.tag(2)

            Text("Notifications")
                .onAppear {
                    self.selectedIndex = 3
                }
                .tabItem {
                    Image(systemName: "heart")
                }.tag(3)

            // TODO: - CurrentUserProfileView(user: self.user)
            Text("Current User Profile")
                .onAppear {
                    self.selectedIndex = 4
                }
                .tabItem {
                    Image(systemName: "person")
                }.tag(4)
        }
        .accentColor(.black)
    }
}

#Preview {
    MainTabView(user: User.MOCK_USERS[0])
}
