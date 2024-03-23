//
//  HomeView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/03/22.
//

import SwiftUI

struct HomeView: View {
    var userManager: UserManager
    
    var body: some View {
        VStack {
            Text("You're logged in.")
                .font(.title)
                .padding()
            Button("Log Out") {
                self.userManager.signOut()
            }
        }
    }
}
