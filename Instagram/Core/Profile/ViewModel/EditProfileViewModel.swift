//
//  EditProfileViewModel.swift
//  Instagram
//
//  Created by Ahanaf Tahmid Rifat on 20/12/24.
//
import Foundation
import PhotosUI
import Firebase
import SwiftUI

@MainActor
class EditProfileViewModel:ObservableObject {
    @Published var user: User
    
    @Published var selectedImage: PhotosPickerItem? {
       didSet {
            Task { await loadImage(fromItem: selectedImage) }
     }
}
    @Published var profileImage: Image?
    
    @Published var fullname = ""
    @Published var bio = ""
    
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
        
        if let fullname = user.fullname{
            self.fullname = fullname
        }
        
        if let bio = user.bio{
            self.bio = bio
        }
    }

func loadImage(fromItem item: PhotosPickerItem?) async {
    guard let item = item else { return }
    
    guard let data = try? await item.loadTransferable(type: Data.self ) else { return }
    guard let uiImage = UIImage(data: data) else { return }
    self.uiImage = uiImage
    self.profileImage = Image(uiImage: uiImage)
}
    func updateUserData() async throws {
        //update profile image if changed
        
        var data = [String: Any]()
        
        if let uiImage = uiImage {
            let imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        
        //update name if changed
        
        if !fullname.isEmpty && user.fullname != fullname {
            data["fullname"] = fullname
        }
        
        //update bio if changed
        
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
        
    }
}

/*import Foundation
import PhotosUI
import Firebase
import SwiftUI

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task { await handleSelectedImage() }
        }
    }
    @Published var profileImage: Image?
    @Published var fullname = ""
    @Published var bio = ""
    
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
        self.fullname = user.fullname ?? ""
        self.bio = user.bio ?? ""
    }
    
    // Handle image selection and loading
    private func handleSelectedImage() async {
        guard let selectedImage = selectedImage else { return }
        await loadImage(fromItem: selectedImage)
    }
    
    // Load image from PhotosPickerItem
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        do {
            if let data = try await item.loadTransferable(type: Data.self),
               let uiImage = UIImage(data: data) {
                self.uiImage = uiImage
                self.profileImage = Image(uiImage: uiImage)
            }
        } catch {
            print("Failed to load image: \(error.localizedDescription)")
        }
    }
    
    // Update user data including profile image
    func updateUserData() async throws {
        var data = [String: Any]()
        
        // Upload image if selected
        if let uiImage = uiImage {
            do {
                let imageUrl = try await ImageUploader.uploadImage(image: uiImage)
                data["profileImageUrl"] = imageUrl
            } catch {
                print("Image upload failed: \(error.localizedDescription)")
            }
        }
        
        // Update name if changed
        if !fullname.isEmpty && user.fullname != fullname {
            data["fullname"] = fullname
        }
        
        // Update bio if changed
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        
        // Save updates to Firestore
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
            print("Profile updated successfully")
        }
    }
}
*/
