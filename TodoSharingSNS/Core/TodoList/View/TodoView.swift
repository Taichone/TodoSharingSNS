//
//  TodoView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/05/03.
//

import SwiftUI

struct TodoView: View {
    @StateObject var todoViewModel: TodoViewModel

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
        }
    }
}

#Preview {
    TodoView(uid: User.MOCK_USERS[0].uid ?? "")
}
