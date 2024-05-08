//
//  Todo.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/05/03.
//

import FirebaseFirestoreSwift
import Firebase

struct Todo: Identifiable, Hashable, Codable {
    @DocumentID var id: String?
    var title: String
    var notes = ""
    var deadline: TodoDeadline
    var completed: Bool
    
    init(id: String = UUID().uuidString, title: String, notes: String = "", deadline: TodoDeadline, completed: Bool) {
        self.id = id
        self.title = title
        self.notes = notes
        self.deadline = deadline
        self.completed = completed
    }
}

extension Todo {
    static let MOCK_TODOS: [Todo] = [
        .init(title: "水やり", deadline: .allday, completed: false),
        .init(title: "買い物", deadline: .morning, completed: true),
        .init(title: "携帯の修理", deadline: .afternoon, completed: false),
        .init(title: "ランボルギーニの洗車", deadline: .allday, completed: false),
        .init(title: "フェラーリの車検", deadline: .morning, completed: true),
        .init(title: "ワゴンRの改造", deadline: .afternoon, completed: false),
        .init(title: "原付の改造", deadline: .tonight, completed: false)
    ]
}

enum TodoDeadline: String, Codable, CaseIterable {
    case allday = "All-day"
    case morning = "Morning"
    case afternoon = "Afternoon"
    case tonight = "Tonight"
}
