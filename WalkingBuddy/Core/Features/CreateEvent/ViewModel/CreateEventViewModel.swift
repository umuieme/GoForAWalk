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

}

