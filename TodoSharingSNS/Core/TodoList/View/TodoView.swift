//
//  TodoView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/05/03.
//

import SwiftUI

struct TodoView: View {
    @StateObject private var todoViewModel: TodoViewModel
    @State private var showAddTodoModal = false

    init(uid: String) {
        self._todoViewModel = StateObject(wrappedValue: TodoViewModel(uid: uid))
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(self.todoViewModel.todoList, id: \.self) { todo in
                    HStack {
                        Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle").onTapGesture {
                            self.todoViewModel.toggleCompleted(todo: todo)
                        }
                        Text(todo.title)
                        // TODO: デバッグ用の即席 UI なので、EditTodoView で削除できるようにする
                        Spacer()
                        Image(systemName: "trash")
                            .onTapGesture {
                                if let id = todo.id {
                                    self.todoViewModel.deleteTodo(id: id)
                                }   
                            }
                    }
                    .foregroundColor(.black)
                }
            }
            .navigationTitle("Todo list") // ナビゲーションバーのタイトル
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        self.showAddTodoModal = true
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.blue)
                    })
                    .sheet(isPresented: self.$showAddTodoModal) {
                        AddTodoView(showModal: self.$showAddTodoModal, todoViewModel: self.todoViewModel)
                    }
                }
            }
        }
    }
}

#Preview {
    TodoView(uid: User.MOCK_USERS[0].uid ?? "")
}
