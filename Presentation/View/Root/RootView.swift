//
//  RootView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/03/24.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var userManager: UserManager
    
    var body: some View {
        if self.userManager.isAuthenticated {
            HomeView(userManager: self.userManager)
        } else {
            SignInView(userManager: self.userManager)
        }
    }
}

#Preview {
    RootView(userManager: UserManager())
}
