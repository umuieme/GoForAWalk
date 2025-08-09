//
//  WalkDetailViewModel.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-08-08.
//

import Foundation

@MainActor
class WalkDetailViewModel : ObservableObject {
        
    @Published var isRequesting: Bool = false
    
    @Published var errorMessage: String?
    @Published var showError: Bool = false
    @Published var isJoinSuccess: Bool = false
    @Published var joinRequest : JoinRequest?
    
    func getJoinRequestStatus(event: Event ) async  {
        
        isRequesting = true
        errorMessage = nil
        showError = false
        
        defer {
            isRequesting = false
        }
        
        do {
            joinRequest = try await ApiService.shared.getRequestStatus(
                forEvent: event.id
            )
        } catch {
            print(error)
            errorMessage = error.localizedDescription
            showError = true
        }
    }
    
    
    func requestToJoin(event: Event ) async {
        isRequesting = true
        showError = false
        errorMessage = nil
        
        defer {
            isRequesting = false
        }
        
        do {
            joinRequest = try await ApiService.shared
                .requestToJoinEvent(event.id, requestedTo: event.createdBy.id);
           
            isJoinSuccess = true
        } catch {
            print(error)
            errorMessage = error.localizedDescription
            showError = true
            
        }
    }
    
    
    
}
