//
//  Post.swift
//  Instagram
//
//  Created by Ahanaf Tahmid Rifat on 13/12/24.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
}

extension Post {
    static var MOCK_POSTS:[Post] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "hey i'm black panther",
            likes: 120,
            imageUrl: "black-panther",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Gotham's Dark Knight",
            likes: 211,
            imageUrl: "batman2",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[1]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "hey i'm Venom",
            likes: 153,
            imageUrl: "venom",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[2]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "hey i'm Spiderman",
            likes: 200,
            imageUrl: "spi",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[3]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "hey i'm Ironman",
            likes: 333,
            imageUrl: "iron",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[4]
        ),
    ]
}
