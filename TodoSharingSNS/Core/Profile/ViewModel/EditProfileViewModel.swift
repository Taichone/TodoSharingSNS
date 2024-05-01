//
//  EditProfileViewModel.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/05/01.
//

import SwiftUI
import PhotosUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: self.selectedImage) } }
    }
    @Published var profileImage: Image?
    @Published var fullname = ""
    @Published var bio = ""
    
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
        
        if let fullname = user.fullname {
            self.fullname = fullname
        }
        
        if let bio = user.bio {
            self.bio = bio
        }
    }

    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }

        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return } // UIKit のイメージ
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage) // SwiftUI のイメージに変換
    }
    
    func updateUserDate() async throws {
        // update profile image if changed
        
        var data = [String: Any]()
        
        if let uiImage = self.uiImage {
            let imageUrl = try await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        
        // update name if changed
        if !self.fullname.isEmpty && self.user.fullname != self.fullname {
            data["fullname"] = self.fullname
        }
        
        // update bio if changed
        if !self.bio.isEmpty && self.user.bio != self.bio {
            data["bio"] = self.bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(self.user.id).updateData(data)
        }
    }
}

