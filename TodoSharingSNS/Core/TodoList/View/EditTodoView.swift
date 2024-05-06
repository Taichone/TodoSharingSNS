//
//  EditTodoView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/05/06.
//

import SwiftUI

struct EditTodoView: View {
    @Binding var showModal: Bool
    @EnvironmentObject var todoViewModel: TodoViewModel
    
    @State private var showDeletionAlert = false
    
    // 引き継ぐ値
    @State private var todoId: String
    @State private var completed: Bool
    
    // 更新可能な値
    @State private var title: String
    @State private var notes: String
    @State private var deadline: TodoDeadline
    
    init(showModal: Binding<Bool>, todo: Todo) {
        self._showModal = showModal
        
        // 引き継ぐ値
        self.todoId = todo.id ?? ""
        self.completed = todo.completed
        
        // 更新可能な値
        self.title = todo.title
        self.notes = todo.notes
        self.deadline = todo.deadline
    }
    
    var body: some View {
        NavigationStack {
            List {
                TodoEditorView(title: self.$title, notes: self.$notes, deadline: self.$deadline)
                
                Section {
                    Button { self.showDeletionAlert.toggle() /*self.tappedDeleteButton()*/ } label: { Text("Delete").foregroundStyle(.red) }
                        .alert("Delete this Todo", isPresented: self.$showDeletionAlert, actions: {
                            Button("Cancel", role: .cancel) {}
                            Button("Delete", role: .destructive) { self.tappedDeleteButton() }
                        }, message: {
                            Text("Are you sure you want to delete this Todo?")
                        })
                }
            }
            .navigationTitle("Edit Todo") // edit
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button { self.tappedCancelButton() } label: { Text("Cancel") }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button { self.tappedUpdateButton() } label: { Text("Update") }
                }
            }
        }
    }
    
    private func tappedDeleteButton() {
        self.todoViewModel.deleteTodo(id: self.todoId)
        self.resetAllProperties()
        self.showModal = false
    }
    
    private func tappedCancelButton() {
        self.resetAllProperties()
        self.showModal = false
    }
    
    private func tappedUpdateButton() {
        let editedTodo = Todo(id: self.todoId,
                           title: self.title,
                           deadline: self.deadline,
                           completed: self.completed)
        self.todoViewModel.updateTodo(todo: editedTodo)
        self.resetAllProperties()
        self.showModal = false
    }
    
    private func resetAllProperties() {
        self.todoId = ""
        self.completed = false
        self.title = ""
        self.notes = ""
        self.deadline = .allday
    }
}
