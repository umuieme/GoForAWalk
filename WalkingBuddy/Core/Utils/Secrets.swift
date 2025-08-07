//
//  Secrets.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-08-07.
//

import Foundation

struct Secrets {
    
    static let projectID: String = {
        guard let id = Bundle.main.infoDictionary?["APPWRITE_PROJECT_ID"] as? String else {
            fatalError("APPWRITE_PROJECT_ID not found in Info.plist. Please ensure it's set in your .xcconfig and linked to your target's Info.plist.")
        }
        return id
    }()

    
    static let bucketID: String = {
        guard let id = Bundle.main.infoDictionary?["BUCKET_ID"] as? String else {
            fatalError("BUCKET_ID not found in Info.plist. Please ensure it's set in your .xcconfig and linked to your target's Info.plist.")
        }
        return id
    }()

  
    static let databaseID: String = {
        guard let id = Bundle.main.infoDictionary?["DATABASE_ID"] as? String else {
            fatalError("DATABASE_ID not found in Info.plist. Please ensure it's set in your .xcconfig and linked to your target's Info.plist.")
        }
        return id
    }()

   
    static let eventCollectionID: String = {
        guard let id = Bundle.main.infoDictionary?["EVENT_COLLECTION_ID"] as? String else {
            fatalError("EVENT_COLLECTION_ID not found in Info.plist. Please ensure it's set in your .xcconfig and linked to your target's Info.plist.")
        }
        return id
    }()
    
    static let locationCollectionID: String = {
        guard let id = Bundle.main.infoDictionary?["LOCATION_COLLECTION_ID"] as? String else {
            fatalError("LOCATION_COLLECTION_ID not found in Info.plist. Please ensure it's set in your .xcconfig and linked to your target's Info.plist.")
        }
        return id
    }()
    
    static let requestCollectionID: String = {
        guard let id = Bundle.main.infoDictionary?["REQUESTS_COLLECTION_ID"] as? String else {
            fatalError("REQUEST_COLLECTION_ID not found in Info.plist. Please ensure it's set in your .xcconfig and linked to your target's Info.plist.")
        }
        return id
    }()
}
