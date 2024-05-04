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
                    }
                    .foregroundColor(.black)
                }
                .onDelete(perform: self.deleteTodo)
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
                        AddTodoModalView(showModal: self.$showAddTodoModal, todoViewModel: self.todoViewModel)
                    }
                }
            }
        }
    }

    private func deleteTodo(at offsets: IndexSet) {
        for index in offsets {
            self.todoViewModel.deleteTodo(at: index)
        }
    }
}

struct AddTodoModalView: View {
    @Binding var showModal: Bool
    @ObservedObject var todoViewModel: TodoViewModel
    @State private var title = ""
    @State private var notes = ""
    
    var body: some View {
        NavigationStack {
            List {
                VStack {
                    TextField("Title", text: self.$title)
                    Divider()
                    TextField("Notes", text: self.$notes)
                }
            }
            .navigationTitle("New Todo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        // 変数をリセットして閉じる
                        self.title = ""
                        self.notes = ""
                        self.showModal = false
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        let newTodo = Todo(title: self.title, notes: self.notes, completed: false)
                        self.todoViewModel.addTodo(todo: newTodo)
                        // 変数をリセットして閉じる
                        self.title = ""
                        self.notes = ""
                        self.showModal = false
                    } label: {
                        Text("Add")
                    }
                }
            }
        }
    }
}

#Preview {
    TodoView(uid: User.MOCK_USERS[0].uid ?? "")
}
