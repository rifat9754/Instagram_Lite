//
//  LoginViewModel.swift
//  Instagram
//
//  Created by Ahanaf Tahmid Rifat on 18/12/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
