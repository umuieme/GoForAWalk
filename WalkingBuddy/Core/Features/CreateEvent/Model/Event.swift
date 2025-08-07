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
    
    func getImagePreviewUrl() -> URL? {
//        https://cloud.appwrite.io/v1/storage/buckets/68928403003ac447fd7d/files/689518fa80ce9e43fa77/view?project=6877e6c70002c6ecdb27
        let url = "\(ApiService.remoteUrl)/storage/buckets/\(Secrets.bucketID)/files/\(imageId)/view?project=\(Secrets.projectID)"
        print(url)
        return URL(
            string: url
        )!

    }
}
