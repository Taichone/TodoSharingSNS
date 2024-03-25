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
        return User(uid: self.currentUid)
    }()
    
    init(currentUid: String) {
        self.currentUid = currentUid
    }
}
