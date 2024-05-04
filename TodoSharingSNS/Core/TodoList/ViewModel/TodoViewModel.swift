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
    
    // TODO: オフライン対応
    // - ローカルに永続化
    // - オンライン復帰後に同期（ローカル優先）

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
    
    func toggleCompleted(todo: Todo) {
        var toggledTodo = todo
        toggledTodo.completed.toggle()
        self.updateTodo(todo: toggledTodo)
    }
    
    private func updateTodo(todo: Todo) {
        guard let id = todo.id else {
            print("Error: Todo does not have a valid documentID.")
            return
        }
        
        // MARK: - ローカル
        if let index = self.todoList.firstIndex(where: { $0.id == todo.id }) {
            self.todoList[index] = todo
        }
        
        // MARK: - Firestore
        guard let encodedTodo = try? Firestore.Encoder().encode(todo) else {
            print("Error: Failed to encode todo.")
            return  
        }

        self.todoListRef.document(id).updateData(encodedTodo) { error in
            if let error = error {
                print("Error updating todo: \(error)")
            } else {
                print("Todo successfully updated.")
            }
        }
    }

    func addTodo(todo: Todo) {
        // MARK: - ローカル
        self.todoList.append(todo)
        
        // MARK: - Firestore
        guard let encodedTodo = try? Firestore.Encoder().encode(todo) else {
            print("Error: Failed to encode todo.")
            return  
        }
        
        self.todoListRef.addDocument(data: encodedTodo) { error in
            if let error = error {
                print("Error adding todo: \(error)")
            } else {
                print("Todo successfully added.")
            }
        }
        
        self.fetchTodoList()
    }
    
    func deleteTodo(at index: Int) {
        if let id = todoList[index].id {
            // Firestore から削除
            self.todoListRef.document(id).delete { error in
                if let error = error {
                    print("Error deleting todo: \(error)")
                } else {
                    self.todoList.remove(at: index) // 成功した場合はローカルからも削除
                }
            }
        } else {
            print("Todo does not have a valid ID.")
        }
    }
}
