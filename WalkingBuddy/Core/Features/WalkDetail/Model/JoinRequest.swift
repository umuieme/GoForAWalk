//
//  JoinRequest.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-08-08.
//

struct JoinRequest : Identifiable, Hashable, Decodable {
    let id: String
    let status: RequestStatus
    let requestedBy: UserInfo
    let requestedTo: UserInfo
    let event: Event
}
