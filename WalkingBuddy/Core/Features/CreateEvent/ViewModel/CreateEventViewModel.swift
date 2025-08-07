//
//  CreateEventViewModel.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-07-10.
//

import Foundation
import UIKit


@MainActor
class CreateEventViewModel : ObservableObject {
    
    @Published var title = ""
    @Published var image : UIImage?
    @Published var startDate = Date()
    @Published var detail = ""
    @Published var pace : WalkingPace?
    @Published var isPublic = false
    @Published var isPacePickerShowing = false
    @Published var startPoint : LocationData?
    @Published var destination : LocationData?
    
    @Published var titleError : String?
    @Published var startDateError : String?
    @Published var detailError : String?
    @Published var paceError : String?
    @Published var startPointError : String?
    @Published var destinationError : String?
    @Published var isSaving = false
    @Published var errorMessage : String?
    @Published var showError = false
    @Published var isSuccess = false
    
    
    func validate() -> Bool {
        var hasError = false
        if title.isEmpty {
            titleError = "Title is required"
            hasError = true
        }
        if detail.isEmpty {
            detailError = "Detail is required"
            hasError = true
        }
        if startPoint == nil {
            startPointError = "Start point is required"
            hasError = true
        }
        if destination == nil {
            destinationError = "Destination is required"
            hasError = true
        }
        if pace == nil {
            paceError = "Pace is required"
            hasError = true
        }
        return hasError
    }
    
    func createEvent() async {
        errorMessage = nil
        guard !validate() else {
            errorMessage = "Please fill all required fields"
            return;
        }
        defer {
            isSaving = false
        }
        do {
            isSaving = true
            try await ApiService.shared
                .createEvent(
                    title: title, detail: detail, startDate: startDate, pace: pace!, isPublic: isPublic, startPoint: startPoint!, destination: destination!, image: image!
                )
            isSuccess = true
        }catch {
            print("Error creating event : \(error.localizedDescription)")
            errorMessage = error.localizedDescription
        }
        
    }
    
    

}

