//
//  ProfileHeaderView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/05/01.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    @State private var showEditProfile = false

    var body: some View {
        VStack(spacing: 10) {
            // pic and stats
            HStack {
                CircularProfileImageView(user: self.user, size: .large)

                Spacer()

                HStack(spacing: 8) {
                    UserStatsView(value: 3, title: "Posts")
                    UserStatsView(value: 3, title: "Followers")
                    UserStatsView(value: 3, title: "Following")
                }
            }
            .padding(.horizontal)

            // name and bio
            VStack(alignment: .leading, spacing: 4) {
                if let fullname = self.user.fullname {
                    Text(fullname)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                if let bio = self.user.bio {
                    Text(bio)
                        .font(.footnote)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)

            // action button
            Button {
                if self.user.isCurrentUser {
                    self.showEditProfile.toggle()
                } else {
                    print("Follow user..")
                }
            } label: {
                Text(self.user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(self.user.isCurrentUser ? .white : Color(.systemBlue))
                    .foregroundStyle(self.user.isCurrentUser ? .black : .white)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 6)))
                    .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(self.user.isCurrentUser ? .gray : .clear, lineWidth: 1)
                    )
            }
            
            
            Divider()
        }
        .fullScreenCover(isPresented: self.$showEditProfile) {
            EditProfileView(user: self.user)
        }
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[0])
}
