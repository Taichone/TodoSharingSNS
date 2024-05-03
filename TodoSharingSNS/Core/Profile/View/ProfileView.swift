//
//  ProfileView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/05/01.
//

import SwiftUI

struct ProfileView: View {
    let user: User

    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1

    var body: some View {
        ScrollView {
            ProfileHeaderView(user: self.user)
            Text("TodoView")   
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS[0])
}
