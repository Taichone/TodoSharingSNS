//
//  AddTodoView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/05/05.
//

import SwiftUI

struct AddTodoView: View {
    @Binding var showModal: Bool
    @EnvironmentObject var todoViewModel: TodoViewModel
    @State private var title = ""
    @State private var notes = ""
    @State private var deadline = TodoDeadline.allday
    
    var body: some View {
        NavigationStack {
            List {
                TodoEditorView(title: self.$title, notes: self.$notes, deadline: self.$deadline)    
            }
            .navigationTitle("Create Todo") // add
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button { self.tappedCancelButton() } label: { Text("Cancel") }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button { self.tappedAddButton() } label: { Text("Add") }
                }
            }
        }
    }
    
    private func tappedCancelButton() {
        self.resetAllProperties()
        self.showModal = false
    }
    
    private func tappedAddButton() {
        let newTodo = Todo(title: self.title,
                           notes: self.notes,
                           deadline: self.deadline,
                           completed: false)
        self.todoViewModel.addTodo(todo: newTodo)
        self.resetAllProperties()
        self.showModal = false
    }
    
    private func resetAllProperties() {
        self.title = ""
        self.notes = ""
        self.deadline = .allday
    }
}
