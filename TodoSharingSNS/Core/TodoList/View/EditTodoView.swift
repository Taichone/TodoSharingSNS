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
            TodoEditorView(title: self.$title, notes: self.$notes, deadline: self.$deadline)
                .navigationTitle("Edit Todo") // edit
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
                        Button { // edit
                            let newTodo = Todo(id: self.todoId, title: self.title, deadline: self.deadline, completed: self.completed)
                            self.todoViewModel.updateTodo(todo: newTodo)
                            self.resetAllProperties()
                            self.showModal = false
                        } label: {
                            Text("Update") // edit
                        }
                    }
                }
            
            Button { // delete
                self.todoViewModel.deleteTodo(id: self.todoId)
                self.resetAllProperties()
                self.showModal = false
            } label: {
                Text("Delete") // edit
                    .foregroundStyle(.red)
            }
            .padding(.bottom)
        }
    }
    
    private func resetAllProperties() {
        self.todoId = ""
        self.completed = false
        self.title = ""
        self.notes = ""
        self.deadline = .allday
    }
}
