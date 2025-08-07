//
//  ApiService.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-06-19.
//

import Appwrite
import UIKit

class ApiService {

    static let shared = ApiService()

    private let client: Client
    private let account: Account
    private let databases: Databases
    private let storage: Storage
    private var user: UserInfo?

    init() {
        //           let config = AppwriteSDK.loadConfig()

        //           self.APPWRITE_PROJECT_ID = config.projectId
        //           self.APPWRITE_PROJECT_NAME = config.projectName
        //           self.APPWRITE_PUBLIC_ENDPOINT = config.endpoint

        client = Client()
            .setProject(Secrets.projectID)
            .setEndpoint("https://cloud.appwrite.io/v1")

        account = Account(client)
        databases = Databases(client)
        storage = Storage(client)
    }

    func loginWithEmail(email: String, password: String) async throws -> Session
    {
        let session = try await account.createEmailPasswordSession(
            email: email,
            password: password
        )
        return session
    }
    
    func logout() async throws {
        try await account.deleteSession(sessionId: "current")
    }

    func registerUser(
        firstName: String, lastName: String, email: String, password: String
    ) async throws -> Session {
        let fullName = "\(firstName) \(lastName)"
        let userId = ID.unique()
        _ = try await account.create(
            userId: userId,
            email: email,
            password: password,
            name: fullName
        )
        
        try await createUser(
            user: UserInfo(
                id: userId,
                firstName: firstName,
                lastName: lastName,
                email: email
            )
        )

        let session = try await loginWithEmail(email: email, password: password)
         _ = try await getCurrentSession()
        return session
    }
    
    func createUser(user: UserInfo) async throws {
        _ = try await databases.createDocument(
            databaseId: Secrets.databaseID,
            collectionId: Secrets.userCollectionID,
                    documentId: user.id,
                    data: [
                        "firstName": user.firstName,
                        "lastName": user.lastName,
                        "email": user.email
                    ]
                )
            
    }

    func getCurrentSession() async throws -> UserInfo {
        let a = try await account.get()
        user = UserInfo(
            id: a.id,
            firstName: a.name,
            lastName: a.name,
            email: a.email
        )
        return user!
    }

    func uploadImage(image: UIImage) async throws -> String {
        guard
            let imageData = image.jpegData(
                compressionQuality: 0.8

            )
        else {
            //            throw NSError(domain: "", code: 0, userInfo: nil)
            return ""
        }
        do {
            let file = try await storage.createFile(
                bucketId: Secrets.bucketID,
                fileId: ID.unique(),
                file:
                    InputFile
                    .fromData(
                        imageData,
                        filename: "\(ID.unique()).jpeg",
                        mimeType: "image/jpeg"
                    )

            )
            return file.id
        } catch {
            print("Error uploading image: \(error)")
            throw error
        }
    }
    func createEvent(
        title: String,
        detail: String,
        startDate: Date,
        pace: WalkingPace,
        isPublic: Bool,
        startPoint: LocationData,
        destination: LocationData,
        image: UIImage?
    ) async throws {

        // 1. Upload image and get file ID
        var imageFileId: String?
        if let image = image {
            imageFileId = try await uploadImage(image: image)
        }

        // 2. Prepare nested data for locations
        let startLocationData: [String: Any] = [
            "latitude": startPoint.latitude,
            "longitude": startPoint.longitude,
            "name": startPoint.name,
        ]

        let destinationLocationData: [String: Any] = [
            "latitude": destination.latitude,
            "longitude": destination.longitude,
            "name": destination.name,
        ]

        // 3. Create the event with nested relationship data
        try await databases.createDocument(
            databaseId: Secrets.databaseID,
            collectionId: Secrets.eventCollectionID,
            documentId: ID.unique(),
            data: [
                "title": title,
                "detail": detail,
                "startDate": ISO8601DateFormatter().string(from: startDate),
                "pace": pace.rawValue,
                "isPublic": isPublic,
                "imageId": imageFileId,
                "createdBy": user?.id,
                "startingPoint": startLocationData,  // relationship (nested)
                "endPoint": destinationLocationData,  // relationship (nested)
            ]
        )
    }

    func getSuggestedEvents() async throws -> [Event] {

        guard let user = user else {
            throw ApiError.userNotfound
        }

        let result = try await databases.listDocuments(
            databaseId: Secrets.databaseID,
            collectionId: Secrets.eventCollectionID,
            queries: [
                Query.equal("isPublic", value: true),
                Query.notEqual("userId", value: user.id),
            ]
        )

        let events: [Event] = result.documents.compactMap { doc in
            do {
                let jsonData = try JSONSerialization.data(
                    withJSONObject: doc.data)
                return try JSONDecoder().decode(Event.self, from: jsonData)
            } catch {
                print("Decoding error: \(error)")
                return nil
            }
        }

        return events

    }

}
