//
//  Post.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/04/07.
//

import Foundation
import Firebase

struct Post:Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              caption: "キャプション0",
              likes: 0,
              imageUrl: "sample-image",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[0]),
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              caption: "キャプション1",
              likes: 0,
              imageUrl: "sample-image",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[1]),
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              caption: "キャプション2",
              likes: 0,
              imageUrl: "sample-image",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[2]),
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              caption: "キャプション3",
              likes: 0,
              imageUrl: "sample-image",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[3]),
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              caption: "キャプション4",
              likes: 0,
              imageUrl: "sample-image",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[4])
    ]
}
