//
//  ResetPasswordView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/03/22.
//

import SwiftUI

struct ResetPasswordView: View {
    @State private var email: String = ""
    @ObservedObject var viewModel: AuthViewModel

    var body: some View {
        VStack {
            TextField("Email", text: self.$email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Reset Password") {
                self.viewModel.resetPassword(email: self.email)
            }
        }
    }
}
