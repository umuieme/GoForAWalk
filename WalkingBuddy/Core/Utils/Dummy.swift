//
//  Dummy.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-07-14.
//

import Foundation

class Dummy {
    
    static func users() -> [UserInfo] {
        return [
            UserInfo(id: "1", name: "Umesh Basnet", email: "test@test.com"),
            UserInfo(id: "2", name: "John Doe", email: "john@doe.com"),
        ]
    }

    static func eventList() -> [Event] {
        let users = self.users()
        
        return [

            // --- UPCOMING EVENTS ---
            Event(
                title: "High Park Sunset Stroll",
                image: "https://ontariohiking.com/wp-content/uploads/2020/05/Toronto-Hiking-Trails-Title.jpg",
                startDate: Date().addingTimeInterval(3600 * 8),  // Today at ~8:26 AM
                detail:
                    "A beautiful walk to catch the sunset from the best viewpoint in the park. We'll walk the main loop. All are welcome!",
                pace: .casualStroll,
                isPublic: true,
                startPoint: LocationData(
                    latitude: 43.6465, longitude: -79.4637,
                    name: "High Park Main Entrance"),
                endPoint: LocationData(
                    latitude: 43.6465, longitude: -79.4637,
                    name: "High Park Main Entrance")  ,
                createdBy: users.randomElement()!
            ),
            Event(
                title: "Waterfront Fitness Walk",
                image: "https://ontariohiking.com/wp-content/uploads/2020/05/Toronto-Hiking-Trails-Title.jpg",
                startDate: Date().addingTimeInterval(3600 * 24 * 2),  // In 2 days
                detail:
                    "Let's get our steps in with a brisk walk along the waterfront. We'll meet at the Harbourfront Centre and walk towards the beaches.",
                pace: .powerWalk,
                isPublic: false,
                startPoint: LocationData(
                    latitude: 43.6387, longitude: -79.3823,
                    name: "Harbourfront Centre South Entrance"),
                endPoint: LocationData(
                    latitude: 43.6480, longitude: -79.3490, name: "Sugar Beach")  ,
                createdBy: users.randomElement()!
            ),
            Event(
                title: "Don Valley Trail Run",
                image: "https://ontariohiking.com/wp-content/uploads/2020/05/Toronto-Hiking-Trails-Title.jpg",
                startDate: Date().addingTimeInterval(3600 * 24 * 7),
                detail:
                    "A challenging but rewarding trail run through the Don Valley. Be prepared for hills and uneven terrain. Let's meet at the Evergreen Brick Works entrance.",
                pace: .run,
                isPublic: false,
                startPoint: LocationData(
                    latitude: 43.6841, longitude: -79.3653,
                    name: "Evergreen Brick Works Welcome Centre"),
                endPoint: LocationData(
                    latitude: 43.6841, longitude: -79.3653,
                    name: "Evergreen Brick Works Welcome Centre") ,
                createdBy: users.randomElement()!

            ),

            // --- PAST EVENTS ---
            Event(
                title: "Riverdale Park Dog Walk",
                image: "https://ontariohiking.com/wp-content/uploads/2020/05/Toronto-Hiking-Trails-Title.jpg",
                startDate: Date().addingTimeInterval(-3600 * 24 * 3),  // 3 days ago
                detail:
                    "A fun and casual walk for all dog lovers and their furry friends. We met at the east park entrance.",
                pace: .casualStroll,
                isPublic: true,
                startPoint: LocationData(
                    latitude: 43.6730, longitude: -79.3553,
                    name: "Riverdale Park East Lookout"),
                endPoint: LocationData(
                    latitude: 43.6730, longitude: -79.3553,
                    name: "Riverdale Park East Lookout") ,
                createdBy: users.randomElement()!

            ),
            Event(
                title: "Urban Exploration: Queen's Park",
                image: "https://ontariohiking.com/wp-content/uploads/2020/05/Toronto-Hiking-Trails-Title.jpg",
                startDate: Date().addingTimeInterval(-3600 * 24 * 10),
                detail: nil,  // Example with no detail
                pace: .steadyWalk,
                isPublic: true,
                startPoint: LocationData(
                    latitude: 43.6677, longitude: -79.3920,
                    name: "Queen's Park Legislative Building"),
                endPoint: LocationData(
                    latitude: 43.6677, longitude: -79.3920,
                    name: "Queen's Park Legislative Building") ,
                createdBy: users.randomElement()!

            ),
            Event(
                title: "Morning Jog by the CN Tower",
                image: "https://ontariohiking.com/wp-content/uploads/2020/05/Toronto-Hiking-Trails-Title.jpg",
                startDate: Date().addingTimeInterval(-3600 * 24),
                detail:
                    "An early morning jog to beat the crowds and see the city wake up.",
                pace: .lightJog,
                isPublic: false,
                startPoint: LocationData(
                    latitude: 43.6426, longitude: -79.3871,
                    name: "Base of the CN Tower"),
                endPoint: LocationData(
                    latitude: 43.6387, longitude: -79.3823,
                    name: "Toronto Ferry Docks") ,
                createdBy: users.randomElement()!

            ),

        ]
    }

}
