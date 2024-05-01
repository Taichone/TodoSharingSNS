//
//  ContentViewModel.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/04/02.
//

import Foundation
import Firebase
import Combine

//@MainActor
class ContentViewModel: ObservableObject {
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()

    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?

    init() {
        self.setupSubscribers()
    }

    func setupSubscribers() {
        self.service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &self.cancellables)
        
        self.service.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &self.cancellables)
    }
}
