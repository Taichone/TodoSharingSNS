//
//  TodoEditorView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/05/06.
//

import SwiftUI

struct TodoEditorView: View {
    @EnvironmentObject var todoViewModel: TodoViewModel
    @Binding var title: String
    @Binding var notes: String
    @Binding var deadline: TodoDeadline
    
    var body: some View {
        Section {
            TextField("Title", text: self.$title)
            TextField("Notes", text: self.$notes)   
        }
        
        Section {
            Picker("Deadline", selection: self.$deadline) {
                ForEach(TodoDeadline.allCases, id: \.self) { (deadlineCase) in
                    Text(deadlineCase.rawValue).tag(deadlineCase)
                }
            }
            .pickerStyle(SegmentedPickerStyle())   
        }
    }
}
