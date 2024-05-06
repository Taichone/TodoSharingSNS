//
//  Constants.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/05/05.
//

import Firebase

struct FirestoreConstants {
    private static let root = Firestore.firestore()
    
    static let userCollection = Self.root.collection("users")
    static let todoListCollection = Self.root.collection("todoLists")
}
