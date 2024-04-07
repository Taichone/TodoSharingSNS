//
//  ContentView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/03/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()

    var body: some View {
        Group {
            if self.viewModel.userSession == nil {
                LoginView()
                    .environmentObject(self.registrationViewModel)
            } else if let currentUser = self.viewModel.currentUser {
                MainTabView(user: currentUser)
            } else {
                Text("DEBUG: userSession isn't nil, but currentUser is nil")
            }
        }
    }
}

#Preview {
    ContentView()
}
