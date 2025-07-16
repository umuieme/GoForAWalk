//
//  enum.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-07-10.
//

import SwiftUICore

enum WalkingPace: String, CaseIterable, Identifiable {
    case casualStroll = "Casual Stroll"
    case steadyWalk = "Steady Walks"
    case powerWalk = "Power Walk"
    case lightJog = "Light Jog"
    case run = "Pace Run"

    var id: Self { self }

    var icon: String {
        switch self {
        case .casualStroll:
            return "tortoise.fill"
        case .steadyWalk:
            return "figure.walk"
        case .powerWalk:
            return "figure.walk.motion"
        case .lightJog:
            return "figure.run"
        case .run:
            return "hare.fill"
        }
    }

    var color: Color {
        switch self {
        case .casualStroll:
            return .teal
        case .steadyWalk:
            return .blue
        case .powerWalk:
            return .purple
        case .lightJog:
            return .orange
        case .run:
            return .red
        }
    }
}

enum Tab: String, CaseIterable {
    case home = "house"
    case myWalks = "walks"
    case createWalk = "createWalk"
    case message = "message"
    case profile = "profile"
    
    var icon : String {
        switch self {
        case .home:
            return "house"
        case .myWalks:
            return "figure.walk"
        case .createWalk:
            return "plus"
        case .message:
            return "message.fill"
        case .profile:
            return "person.fill"
        }
    }
}

enum MyWalkType: String, CaseIterable {
    case upcoming = "Upcoming"
    case pending = "Pending"
    case past = "Past"
}
