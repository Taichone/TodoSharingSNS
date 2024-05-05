//
//  Constants.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/05/05.
//

import Firebase

struct FirestoreConstants {
    private static let root = Firestore.firestore()
    
    static let userCollection = root.collection("users")
    static let todoListCollection = root.collection("todoLists")
}
