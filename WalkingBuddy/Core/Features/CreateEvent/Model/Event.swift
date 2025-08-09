//
//  Event.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-07-10.
//

import Foundation

struct Event : Identifiable, Hashable, Decodable {
    let id : String
    let title: String
    let imageId: String
    let startDate: Date
    let detail: String?
    let pace: WalkingPace
    let isPublic: Bool
    let startingPoint: LocationData
    let endPoint: LocationData
    let createdBy: UserInfo
    
    func getUserName() -> String {
        return createdBy.firstName
    }
    
    func getImagePreviewUrl() -> String? {
       return "\(ApiService.remoteUrl)/storage/buckets/\(Secrets.bucketID)/files/\(imageId)/view?project=\(Secrets.projectID)"
    }
}
