//
//  User.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-06-19.
//

import Foundation

struct User : Identifiable, Hashable{
    let id: UUID = UUID()
    let name: String
    let email: String
}
