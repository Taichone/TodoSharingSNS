//
//  MainTabView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/03/22.
//

import SwiftUI

struct MainTabView: View {
    let user: User
    @State private var selectedIndex = 2

    var body: some View {
        TabView(selection: self.$selectedIndex) {
            // TODO: - FeedView()
            Text("FollowingUsersView")
                .onAppear {
                    self.selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "person.crop.rectangle.stack.fill")
                }.tag(0)

            TodoView(uid: self.user.uid ?? "")
                .onAppear {
                    self.selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "list.bullet")
                }.tag(1)

             CurrentUserProfileView(user: self.user)
                .onAppear {
                    self.selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "person")
                }.tag(2)
        }
        .accentColor(.black)
    }
}

#Preview {
    MainTabView(user: User.MOCK_USERS[0])
}
