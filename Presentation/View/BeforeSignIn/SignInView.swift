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
    @ObservedObject var userManager: UserManager
    
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
                    self.userManager.signIn(email: self.email, password: self.password)
                }
                
                // 新規登録画面へ遷移
                NavigationLink(destination: SignUpView(userManager: self.userManager)) {
                    Text("Create Account")
                        .padding(.top, 16)
                }
                // パスワードリセット画面へ遷移
                NavigationLink(destination: ResetPasswordView(userManager: self.userManager)) {
                    Text("Reset Password")
                        .padding(.top, 16)
                }
            }
        }
    }
}
