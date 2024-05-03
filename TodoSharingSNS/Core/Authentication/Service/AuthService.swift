//
//  AuthService.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/04/06.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?

    static let shared = AuthService() // 常にこれを用いることで、同一のインスタンスを共有できる

    init() {
        Task { try await self.loadUserData() }
    }

    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await self.loadUserData()
        } catch {
            print("DEBUG:Failed to log in with error \(error.localizedDescription)")
        }
    }

    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await self.uploadUserData(uid: result.user.uid, username: username, email: email)
        } catch {
            print("DEBUG:Failed to register user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser // ローカルに保存されている
        guard let currentUid = self.userSession?.uid else { return }
        self.currentUser = try await UserService.fetchUser(withUid: currentUid)
    }

    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }

    private func uploadUserData(uid: String, username: String, email: String) async {
        let user = User(uid: uid, username: username, email: email)
        self.currentUser = user
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return } // Codable 準拠した型が encode 可能
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}

// TODO: パスワードリセット
//func resetPassword(email: String) {
//    Auth.auth().sendPasswordReset(withEmail: email) { error in
//        if let error = error {
//            print("Error in sending password reset: \(error)")
//        }
//    }
//}
