//
//  TodoEditorView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/05/06.
//

import SwiftUI

struct TodoEditorView: View {
    @Binding var title: String
    @Binding var notes: String
    @Binding var deadline: TodoDeadline
    
    var body: some View {
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
    }
}
