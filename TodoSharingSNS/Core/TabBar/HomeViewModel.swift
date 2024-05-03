//
//  HomeViewModel.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/03/24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    let currentUid: String
    lazy var user: User = {
        return User(uid: self.currentUid, username: "", email: "")
    }()
    
    init(currentUid: String) {
        self.currentUid = currentUid
    }
}
