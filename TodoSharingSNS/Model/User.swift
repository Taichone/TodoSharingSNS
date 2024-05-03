//
//  User.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/03/23.
//

import Firebase
import FirebaseFirestoreSwift

struct User:Identifiable, Codable {
    @DocumentID var uid: String?
    var username:String
    let email: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    var stats: UserStats? // Followers 数, Following　数
    var isFollowed: Bool? = false
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == self.uid }
    var id: String { return self.uid ?? UUID().uuidString }
    
    var todoList: [Todo]?
}

extension User: Hashable {
    var identifier: String { return self.id }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(self.identifier)
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(uid: UUID().uuidString, username: "tori", email: "toritani@gmail.com", profileImageUrl: nil, fullname: "鳥谷敬", bio: "さぁ俺がヒーローだ", todoList: Todo.MOCK_TODOS),
        .init(uid: UUID().uuidString, username: "chojin", email: "itoi@gmail.com", profileImageUrl: nil, fullname: "糸井嘉男", bio: "超人です", todoList: Todo.MOCK_TODOS),
        .init(uid: UUID().uuidString, username: "koji.speed", email: "chikamoto@gmail.com", profileImageUrl: nil, fullname: "近本光司", bio: "tigers #5", todoList: Todo.MOCK_TODOS),
        .init(uid: UUID().uuidString, username: "kinami_seiya", email: "kinami@gmail.com", profileImageUrl: nil, fullname: "木浪聖也", bio: "タイガース #0", todoList: Todo.MOCK_TODOS),
        .init(uid: UUID().uuidString, username: "taku_dream", email: "nakano@gmail.com", profileImageUrl: nil, fullname: "中野拓夢", bio: "tigers #51", todoList: Todo.MOCK_TODOS),
        .init(uid: UUID().uuidString, username: "all_nil", email: "nil@gmail.com", profileImageUrl: nil, fullname: nil, bio: nil)
    ]
}

struct UserStats: Codable {
    var following: Int
    var posts: Int
    var followers: Int
}
