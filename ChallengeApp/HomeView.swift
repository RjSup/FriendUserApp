//
//  HomeView.swift
//  ChallengeApp
//
//  Created by Ryan on 04/10/2025.
//

import SwiftUI

struct HomeView: View {
    let user: [User]
   
    var body: some View {
        List(user) { user in
            NavigationLink(value: user) {
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.headline)
                    Text(user.isActive ? "Online" : "Offline")
                        .foregroundStyle(.secondary)
                        .foregroundColor(user.isActive ? .green : .red)
                }
            }
        }
        .navigationTitle("Users")
        .navigationDestination(for: User.self) { user in
            DetailedView(user: user)
        }
    }
}

#Preview {
    NavigationStack {
        HomeView(user: [
            User(
                id: UUID(),
                name: "Test User",
                age: 30,
                company: "Example Co",
                email: "test@example.com",
                isActive: true,
                friends: [
                    Friend(id: UUID(), name: "Test Two")
                ]
            ),
            User(
                id: UUID(),
                name: "Another User",
                age: 27,
                company: "Another Co",
                email: "another@example.com",
                isActive: false,
                friends: [
                    Friend(id: UUID(), name: "Friend Three")
                ]
            )
        ])
    }
}
