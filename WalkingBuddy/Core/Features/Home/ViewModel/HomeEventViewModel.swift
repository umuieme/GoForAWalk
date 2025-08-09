//
//  HomeEventViewModel.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-08-07.
//

import Foundation

@MainActor
class HomeEventViewModel: ObservableObject {

    @Published var events: [Event] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    init() {
        Task {
            await loadEvents()
        }
    }

    func loadEvents() async {
        isLoading = true
        errorMessage = nil
        defer {
            isLoading = false
        }
        do {
            events = try await ApiService.shared.getSuggestedEvents()
        } catch let error {
            print("Error loading events: \(error)")
            errorMessage = "Failed to load events"
        }
    }

}
