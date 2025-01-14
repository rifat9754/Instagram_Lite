//
//  UserService.swift
//  Instagram
//
//  Created by Ahanaf Tahmid Rifat on 18/12/24.
//

import Foundation
import Firebase

struct UserService {
    
    static func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }

    func fetchAllUsers() async throws -> [User] {
        
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let documents = snapshot.documents
        
        return snapshot.documents.compactMap({ try? $0.data(as: User.self)})
    }
}
