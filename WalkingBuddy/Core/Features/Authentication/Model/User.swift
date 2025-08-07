//
//  User.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-06-19.
//

import Foundation

struct UserInfo : Identifiable, Hashable, Decodable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
}
