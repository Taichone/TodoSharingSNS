//
//  AuthViewModel.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/03/22.
//

import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var currentUid: String?
    var isAuthenticated: Bool {
        return self.currentUid != nil
    }
    /// - アプリの起動時に認証状態をチェック
    init() {
        self.observeAuthChanges()
    }
    
    private func observeAuthChanges() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                if let user = user {
                    self?.currentUid = user.uid
                }
            }
        }
    }
    
    /// Sign in to your existing account
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            DispatchQueue.main.async {
                if let result = result, error == nil {
                    self?.currentUid = result.user.uid // 同様の処理が Listener で発火するので不要かも
                }
            }
        }
    }
    
    /// Create a new account
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            DispatchQueue.main.async {
                if let result = result, error == nil {
                    self?.currentUid = result.user.uid // 同様の処理が Listener で発火するので不要かも
                }
            }
        }
    }
    
    /// Reset password
    func resetPassword(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print("Error in sending password reset: \(error)")
            }
        }
    }
    
    /// Sign out
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.currentUid = nil
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
