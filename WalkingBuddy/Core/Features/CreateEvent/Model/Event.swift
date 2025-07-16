//
//  Event.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-07-10.
//

import Foundation

struct Event : Identifiable, Hashable {
    let id = UUID()
    let title: String
    let image: String
    let startDate: Date
    let detail: String?
    let pace: WalkingPace
    let isPublic: Bool
    let startPoint: LocationData
    let endPoint: LocationData
    let createdBy: User
    
    func getUserName() -> String {
        return createdBy.name
    }
}
