//
//  CurrentUserProfileView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/04/07.
//

import SwiftUI

struct CurrentUserProfileView: View {
    var user: User

    var body: some View {
        NavigationStack {
            ScrollView {
                ProfileHeaderView(user: self.user)
                Text(self.user.uid ?? "Error: User.uid is nil")
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        AuthService.shared.signout()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.MOCK_USERS[0])
}
