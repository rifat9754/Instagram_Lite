//
//  RegistrationViewModel.swift
//  Instagram
//
//  Created by Ahanaf Tahmid Rifat on 14/12/24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser()  async throws{
       try await AuthService.shared.createUser(email: email, password: password, username: username)
         
        username = ""
        email = ""
        password = ""
    }
}
