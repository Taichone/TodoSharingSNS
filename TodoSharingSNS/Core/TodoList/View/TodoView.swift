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
    @State private var deadline = TodoDeadline.allday
    
    var body: some View {
        NavigationStack {
            List {
                VStack {
                    TextField("Title", text: self.$title)
                    Divider()
                    TextField("Notes", text: self.$notes)
                    Divider()
                    Picker("", selection: self.$deadline) {
                        ForEach(TodoDeadline.allCases, id: \.self) { (deadlineCase) in
                            Text(deadlineCase.rawValue).tag(deadlineCase)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())   
                }
            }
            .navigationTitle("New Todo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        self.resetAllProperties()
                        self.showModal = false
                    } label: {
                        Text("Cancel")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        let newTodo = Todo(title: self.title,
                                           notes: self.notes,
                                           deadline: self.deadline,
                                           completed: false)
                        self.todoViewModel.addTodo(todo: newTodo)
                        self.resetAllProperties()
                        self.showModal = false
                    } label: {
                        Text("Add")
                    }
                }
            }
        }
    }
    
    private func resetAllProperties() {
        self.title = ""
        self.notes = ""
        self.deadline = .allday
    }
}

#Preview {
    TodoView(uid: User.MOCK_USERS[0].uid ?? "")
}
