//
//  enum.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-07-10.
//

enum WalkingPace : String, CaseIterable, Identifiable {
    case casualStroll = "Casual Stroll"
    case steadyWalk = "Steady Walks"
    case powerWalk = "Power Walk"
    case lightJob = "Light Jog"
    case run = "Pace Run"
    
    var id: Self {self}
}
