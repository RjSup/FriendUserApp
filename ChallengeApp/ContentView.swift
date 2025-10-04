//
//  ContentView.swift
//  ChallengeApp
//
//  Created by Ryan on 03/10/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var users: [User] = []
    
    var body: some View {
        TabView {
            Tab("Users", systemImage: "person") {
                NavigationStack {
                    HomeView(user: users)
                }
                .task {
                    await loadData()
                }
            }
            Tab("Search", systemImage: "magnifyingglass") {
                SearchView(user: users)
            }
            Tab("Settings", systemImage: "gear") {
                SettingsView()
            }
        }
    }
    
    func loadData() async {
        // visit the url
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Error: invalid URL")
            return
        }
        
        if users.isEmpty {
            do {
                // fetch the data
                let (data, _) = try await URLSession.shared.data(from: url)
                
                // decode the result
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let decoded = try? decoder.decode([User].self, from: data) {
                    users = decoded
                } else {
                    print("Error decoding the data")
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }

        }
    }
}

#Preview {
    ContentView()
}
