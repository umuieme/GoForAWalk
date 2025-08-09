//
//  appwrite_extension.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-08-08.
//

import AppwriteModels
import Foundation

extension Document {
    func toObject<U: Decodable>(_ type: U.Type) throws -> U {
        let jsonData = try JSONEncoder().encode(data)
        let decoder = JSONDecoder()
        
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [
            .withInternetDateTime, .withFractionalSeconds,
        ]

        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            if let date = isoFormatter.date(from: dateString) {
                return date
            }
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid date format: \(dateString)")
        }
        
        
        return try decoder.decode(U.self, from: jsonData)
        
    }
}
