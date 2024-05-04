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
            List(0..<self.todoViewModel.todoList.count, id:\.self) { index in
                HStack {
                    Image(systemName: self.todoViewModel.todoList[index].completed ? "checkmark.circle.fill" : "circle").onTapGesture {
                        self.todoViewModel.toggleCompleted(index: index)
                    }
                    Text(self.todoViewModel.todoList[index].title) // セルに表示するのはタイトルのみ
                }
                .foregroundColor(.black)
            }
//            .listStyle(GroupedListStyle()) // イケてるリストスタイルに設定
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
                        self.showModal = false
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        let newTodo = Todo(title: self.title, notes: self.notes, completed: false)
                        self.todoViewModel.addTodo(todo: newTodo)
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
