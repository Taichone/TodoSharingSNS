//
//  Todo.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/03/21.
//

import Foundation

public struct Todo {
    let id = UUID().uuidString // TODO: Firebase の @DocumentID を検討
    var title: String
    var completed: Bool
    var note: String
    var deadline: Date
}
