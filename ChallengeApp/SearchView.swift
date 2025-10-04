//
//  SearchView.swift
//  ChallengeApp
//
//  Created by Ryan on 04/10/2025.
//

import SwiftUI

struct SearchView: View {
    var user: [User]
    @State private var name: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Search for a user")
                TextField("Users", text: $name)
                    .font(.headline)
                
                let matches = user.filter { $0.name.localizedCaseInsensitiveContains(name)
                }
                
                ForEach(matches) { match in
                    NavigationLink(value: match) {
                        DetailedView(user: match)
                    }
                }
            }
        }
        .navigationTitle("Search")
    }
}

#Preview {
    SearchView(user: [
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
        )
    ])
}

