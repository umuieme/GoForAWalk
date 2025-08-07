//
//  error.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-08-07.
//

import Foundation

enum ApiError: Error, LocalizedError {
    case unauthorized
    case notFound
    case invalidData
    case decodingFailed(Error)
    case serverError(String)
    case unknown(Error)
    case userNotfound
    
    var errorDescription: String? {
        switch self {
        case .unauthorized:
            return "You are not authorized to perform this action."
        case .notFound:
            return "The requested resource was not found."
        case .invalidData:
            return "Invalid data received from server."
        case .decodingFailed(let error):
            return "Failed to decode server response."
        case .serverError(let message):
            return message
        case .unknown(let error):
            return error.localizedDescription
        case .userNotfound:
            return "User not logged in"
        }
    }
}
