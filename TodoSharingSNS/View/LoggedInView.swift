//
//  LoggedInView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/03/22.
//

import SwiftUI

struct LoggedInView: View {
    var viewModel: AuthViewModel

    var body: some View {
        VStack {
            Text("Hello, you're logged in!")
                .font(.title)
                .padding()
            Button("Log Out") {
                // ログアウトしてログイン画面へ遷移する
                self.viewModel.signOut()
            }
        }
    }
}
