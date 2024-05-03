//
//  TodoViewModel.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/05/03.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class TodoViewModel: ObservableObject {
    private let todoListRef: CollectionReference
    private let uid: String // 所有者の uid
    @Published var todoList = [Todo]()
    
    init(uid: String) {
        self.uid = uid
        self.todoListRef = Firestore.firestore().collection("todoLists").document(uid).collection("todoList")
        self.fetchTodoList()
    }

    private func fetchTodoList() {
        self.todoListRef.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error fetching todoList: \(error)")
                return
            }
            
            var todoList = [Todo]()
            for document in snapshot?.documents ?? [] {
                do {
                    let todo = try document.data(as: Todo.self)
                    todoList.append(todo)
                } catch {
                    print("Error decoding todo: \(error)")
                }
            }
            
            self.todoList = todoList
        }
    }
    
    private func addTodo(todo: Todo) {
        // Codable 準拠した Todo をエンコード
        guard let encodedTodo = try? Firestore.Encoder().encode(todo) else {
            print("Error: Failed to encode todo.")
            return  
        }
        
        // 新しいドキュメントを作成
        self.todoListRef.addDocument(data: encodedTodo) { error in
            if let error = error {
                print("Error adding todo: \(error)")
            } else {
                print("Todo successfully added.")
            }
        }
    }
}
