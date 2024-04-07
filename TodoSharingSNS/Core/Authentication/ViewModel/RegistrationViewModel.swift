//
//  RegistrationViewModel.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/04/06.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""

    func createUser() async throws {
        try await AuthService.shared.createUser(email: self.email, password: self.password, username: self.username)

        // 値をリセット
        self.username = ""
        self.email = ""
        self.password = ""
    }
}
