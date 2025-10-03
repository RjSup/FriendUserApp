//
//  DetailedView.swift
//  ChallengeApp
//
//  Created by Ryan on 03/10/2025.
//

import SwiftUI

struct DetailedView: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Spacer()
            Text(user.name)
                .font(.title)
            Text("Email: \(user.email)")
            Text("Company: \(user.company)")
            Text("Age: \(user.age)")
            Spacer()
            Text("Friends: ")
            ForEach(user.friends) { friend in
                Text(friend.name)
            }
            Spacer()
        }
    }
}

#Preview {
    DetailedView(user: User(
        id: UUID(),
        name: "Test User",
        age: 30,
        company: "Example Co",
        email: "test@example.com",
        isActive: true,
        friends: [
            Friend(id: UUID(), name: "Test Two")
        ]
    ))
}
