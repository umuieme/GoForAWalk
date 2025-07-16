//
//  CreateEventViewModel.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-07-10.
//

import Foundation
import UIKit


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

}

