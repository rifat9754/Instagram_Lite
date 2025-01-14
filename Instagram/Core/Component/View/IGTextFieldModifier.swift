//
//  IGTextFieldModifier.swift
//  Instagram
//
//  Created by Ahanaf Tahmid Rifat on 13/12/24.
//

import SwiftUI


struct IGTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .font(.headline)
        .padding(15)
        .background(Color(.systemGray5))
        .cornerRadius(10)
        .padding(.horizontal,24)
    }
}
