//
//  SearchViewModel.swift
//  Instagram
//
//  Created by Ahanaf Tahmid Rifat on 18/12/24.
//

import Foundation

class SearchViewModel: ObservableObject {

    @Published var users = [User]()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService().fetchAllUsers()
    }
}
