//
//  ResetPasswordView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/03/22.
//

import SwiftUI

struct ResetPasswordView: View {
    @State private var email: String = ""
    @ObservedObject var userManager: UserManager
    
    var body: some View {
        VStack {
            TextField("Email", text: self.$email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Reset Password") {
                self.userManager.resetPassword(email: self.email)
            }
        }
    }
}
