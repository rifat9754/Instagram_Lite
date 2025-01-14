//
//  EditProfileView.swift
//  Instagram
//
//  Created by Ahanaf Tahmid Rifat on 20/12/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment( \.dismiss )  var dismiss

    @StateObject var viewModel: EditProfileViewModel
    
    init(user: User){
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            //toolbar
            VStack {
                HStack{
                    Button("Cancle") {
                        dismiss()
                    }
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button {
                        Task { 
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                    }
                   
                }
                .padding(.horizontal)
                
                Divider()
            }
            //edit profile pic
            PhotosPicker(selection: $viewModel.selectedImage ){
                VStack {
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .foregroundColor(.white)
                            .background(.gray)
                            .clipShape(Circle())
                            .frame(width: 80, height: 80)
                    } else {
                      /*  Image(systemName: "person")
                            .resizable()
                            .foregroundColor(.white)
                            .background(.gray)
                            .clipShape(Circle())
                            .frame(width: 80, height: 80) */
                        CircularProfileImageView(user: viewModel.user, size: .large )
                        
                    }
                    Text("Edit profile picture")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Divider()
                }
            }
            
            .padding(.vertical, 8)
            
            //edit profile info
            
            VStack {
                EditProfileRowView(title: "Name", placeholder: "Enter your name...", text: $viewModel.fullname)
                
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio...", text: $viewModel.bio)
                
                Spacer()
            }
        }
    }
}

struct EditProfileRowView: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View{
        
        HStack{
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
            
            VStack {
                TextField(placeholder, text: $text)
                
                Divider()
            }
            
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}

#Preview {
    EditProfileView(user: User.MOCK_USERS[0])
}
