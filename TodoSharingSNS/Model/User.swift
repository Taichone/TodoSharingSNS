//
//  User.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/03/23.
//

import Foundation
import Firebase

struct User:Identifiable, Hashable, Codable {
    let id: String
    var username:String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == self.id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: UUID().uuidString, username: "tori", profileImageUrl: nil, fullname: "鳥谷敬", bio: "さぁ俺がヒーローだ", email: "toritani@gmail.com"),
        .init(id: UUID().uuidString, username: "chojin", profileImageUrl: nil, fullname: "糸井嘉男", bio: "超人です", email: "itoi@gmail.com"),
        .init(id: UUID().uuidString, username: "koji.speed", profileImageUrl: nil, fullname: "近本光司", bio: "tigers #5", email: "chikamoto@gmail.com"),
        .init(id: UUID().uuidString, username: "kinami_seiya", profileImageUrl: nil, fullname: "木浪聖也", bio: "タイガース #0", email: "kinami@gmail.com"),
        .init(id: UUID().uuidString, username: "taku_dream", profileImageUrl: nil, fullname: "中野拓夢", bio: "tigers #51", email: "nakano@gmail.com"),
        .init(id: UUID().uuidString, username: "all_nil", profileImageUrl: nil, fullname: nil, bio: nil, email: "nil@gmail.com")
    ]
}
