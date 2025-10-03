//
//  User.swift
//  ChallengeApp
//
//  Created by Ryan on 03/10/2025.
//

import SwiftUI

struct User: Codable, Identifiable, Hashable {
    let id: UUID
    let name: String
    let age: Int
    let company: String
    let email: String
    let isActive: Bool
    let friends: [Friend]
}
