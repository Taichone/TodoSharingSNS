//
//  SignUpView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/03/22.
//

import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @ObservedObject var viewModel: AuthViewModel

    var body: some View {
        VStack {
            TextField("Email", text: self.$email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: self.$password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Sign Up") {
                self.viewModel.signUp(email: self.email, password: self.password)
            }

            if self.viewModel.isAuthenticated {
                // ログイン後のページに遷移
                if self.viewModel.isAuthenticated {
                    LoggedInView(viewModel: self.viewModel)
                }

            }
        }
    }
}
