//
//  User.swift
//  Users
//
//  Created by Salih Özdemir on 23.03.2023.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int16
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let friends: [Friend]?
    let tags: [String]?
}
