//
//  UserStatView.swift
//  Instagram
//
//  Created by Ahanaf Tahmid Rifat on 19/11/24.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text("\(title)")
                .font(.footnote)
        }
        .frame(width: 76)
    }
}

#Preview {
    UserStatView(value: 12, title: "Posts")
}
