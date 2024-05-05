//
//  AddTodoView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/05/05.
//

import SwiftUI

struct AddTodoView: View {
    @Binding var showModal: Bool
    @ObservedObject var todoViewModel: TodoViewModel
    @State private var title = ""
    @State private var notes = ""
    @State private var deadline = TodoDeadline.allday
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Title", text: self.$title)
                    TextField("Notes", text: self.$notes)   
                }
                
                Picker("Deadline", selection: self.$deadline) {
                    ForEach(TodoDeadline.allCases, id: \.self) { (deadlineCase) in
                        Text(deadlineCase.rawValue).tag(deadlineCase)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())      
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
