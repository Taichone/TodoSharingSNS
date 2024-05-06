//
//  LoginView.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/03/22.

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                // logo image
                Text("iMana")
                    .font(.title)
                    .fontWeight(.bold)

                // text fields
                VStack {
                    TextField("Enter your email", text: self.$viewModel.email)
                        .textInputAutocapitalization(.none)
                        .modifier(TextFieldModifier())

                    SecureField("Enter your password", text: self.$viewModel.password)
                        .modifier(TextFieldModifier())
                }

                Button {
                    print("Show forgot password")
                } label: {
                    Text("Forgot Password")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.mint)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)

                Button {
                    Task { try await self.viewModel.signIn() }
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width:360, height: 44)
                        .background(Color.mint)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                }
                .padding(.vertical)
                
                // --- OR --
                HStack {
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                        .foregroundStyle(.gray)
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                        .foregroundStyle(.gray)
                }
                
                Text("Don't have an account?")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)

                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden() // あえて練習のため
                } label: {
                    Text("Create Account")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width:360, height: 44)
                        .background(Color.mint)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
