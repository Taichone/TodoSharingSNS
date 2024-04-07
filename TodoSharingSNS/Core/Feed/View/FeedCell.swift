//
//  FeedCell.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/04/07.
//

import SwiftUI
//import Kingfisher

struct FeedCell: View {
    let post: Post

    var body: some View {
        VStack {
            // image + username
            HStack {
                if let user = self.post.user {
                    // TODO: CircularProfileImageView(user: user, size: .xSmall)
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }

                Spacer()
            }
            .padding(.leading, 8)

            // post image
            // TODO: KFImage(URL(string: self.post.imageUrl))
            Rectangle()
//                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())

            // action buttons
            HStack {
                Button {
                    print("Like post")
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }

                Button {
                    print("Comment on post")
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }

                Button {
                    print("Share post")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }

                Spacer()

            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundStyle(.black)

            // likes label

            Text("\(self.post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)

            // caption label

            HStack {
                // + はどちらかの Text が長くなっても、先頭で揃って繋がった感じにできる
                Text("\(self.post.user?.username ?? "") ").fontWeight(.semibold) +
                Text(self.post.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.leading, 10)
            .padding(.top, 1)

            Text("6h ago")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    FeedCell(post: Post.MOCK_POSTS[0])
}
