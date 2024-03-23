//
//  SignInView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/03/22.
//

import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @ObservedObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Email", text: self.$email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: self.$password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Sign In") {
                    self.viewModel.signIn(email: self.email, password: self.password)
                }
                
                // 新規登録画面へ遷移
                NavigationLink(destination: SignUpView(viewModel: self.viewModel)) {
                    Text("Create Account")
                        .padding(.top, 16)
                }
                // パスワードリセット画面へ遷移
                NavigationLink(destination: ResetPasswordView(viewModel: self.viewModel)) {
                    Text("Reset Password")
                        .padding(.top, 16)
                }
            }
        }
    }
}
