//
//  HomeView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/03/22.
//

import SwiftUI

struct HomeView: View {
    var userManager: UserManager
    @State private var selectedTab = 1
    
    var body: some View {
        TabView(selection: self.$selectedTab) {
            Text("Friend List View").tabItem { Image(systemName: "person.2.fill") }.tag(1)
            Text("My Todo List View").tabItem { Image(systemName: "list.bullet") }.tag(2)
            VStack {
                Text(self.userManager.currentUid ?? "uid: nil")
                Button("Log Out") {
                    self.userManager.signOut()
                }
            }.tabItem { Image(systemName: "gear") }.tag(3)
        }
    }
}

fileprivate struct HomeViewWrapper: View {
    @State private var userManager = UserManager()
    var body: some View {
        HomeView(userManager: self.userManager)
    }
}

#Preview {
    HomeViewWrapper()
}
