//
//  LoginViewModel.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/04/06.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""

    func signIn() async throws {
        try await AuthService.shared.login(withEmail: self.email, password: self.password)
    }
}
