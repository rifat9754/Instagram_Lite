//
//  User.swift
//  Instagram
//
//  Created by Ahanaf Tahmid Rifat on 13/12/24.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    var email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
    
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "Black Panther", profileImageUrl: "black-panther", fullname: "Chadwick Bozeman", bio: "Stay safe", email: "panther@gmail.com"),
        .init(id: NSUUID().uuidString, username: "Batman", profileImageUrl: "batman2", fullname: "Bruce Wane", bio: "Gotham's Dark Knight", email: "batman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "Venom", profileImageUrl: "venom", fullname: "Eddie Broke", bio: "Venom", email: "venom@gmail.com"),
        .init(id: NSUUID().uuidString, username: "Spiderman", profileImageUrl: "spi", fullname: "Petter Parker", bio: "Spidy is every where", email: "spidy@gmail.com"),
        .init(id: NSUUID().uuidString, username: "Iron man", profileImageUrl: "iron", fullname: "Tony Stark", bio: "I'm Ironman", email: "ironman@gmail.com")
    ]
}
