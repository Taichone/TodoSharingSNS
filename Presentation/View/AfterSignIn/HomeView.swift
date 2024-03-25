//
//  HomeView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/03/22.
//

import SwiftUI

struct HomeView: View {
    var viewModel: RootViewModel
    @State private var selectedTab = 1
    
    var body: some View {
        TabView(selection: self.$selectedTab) {
            Text("Friend List View").tabItem { Image(systemName: "person.2.fill") }.tag(1)
            Text("My Todo List View").tabItem { Image(systemName: "list.bullet") }.tag(2)
            VStack {
                Text(self.viewModel.currentUid ?? "uid: nil")
                Button("Log Out") {
                    self.viewModel.signOut()
                }
            }.tabItem { Image(systemName: "gear") }.tag(3)
        }
    }
}

#Preview {
    HomeView(viewModel: RootViewModel())
}
