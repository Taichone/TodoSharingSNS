//
//  TodoView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/05/03.
//

import SwiftUI

struct TodoView: View {
    @EnvironmentObject private var todoViewModel: TodoViewModel
    @State private var showAddTodoModal = false
    @State private var showEditTodoModal = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(self.todoViewModel.todoList, id: \.self) { todo in
                    HStack {
                        Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle")
                            .foregroundStyle(Color(.label))
                            .onTapGesture {
                            self.todoViewModel.toggleCompleted(todo: todo)
                        }
                        Text(todo.title)
                            .foregroundStyle(Color(.label))
                        Spacer()
                        Image(systemName: "info.circle")
                            .foregroundStyle(.mint)
                            .onTapGesture {
                                self.todoViewModel.targetTodo = todo
                                self.showEditTodoModal = true
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
                            .foregroundStyle(.mint)
                    })
                    .sheet(isPresented: self.$showAddTodoModal) {
                        AddTodoView(showModal: self.$showAddTodoModal)
                    }
                    .sheet(isPresented: self.$showEditTodoModal){
                        if let targetTodo = self.todoViewModel.targetTodo {
                            EditTodoView(showModal: self.$showEditTodoModal, todo: targetTodo) 
                        } else {
                            Text("Error: targetTodo is nil")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    TodoView()
        .environmentObject(TodoViewModel(uid: User.MOCK_USERS[0].uid ?? ""))
}
