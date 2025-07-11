//
//  LocationManager.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-07-10.
//

import Foundation
import MapKit
import Combine

class LocationPickerViewModel: ObservableObject {

    @Published var searchResults: [LocationData] = []
    @Published var selectedLocation: LocationData? {
        didSet {
            searchQuery = ""
        }
    }
    @Published var searchQuery: String = "" 
    private var cancellables = Set<AnyCancellable>()
    
    init () {
        $searchQuery.debounce(for: 0.5, scheduler: DispatchQueue.main)
            .sink { query in
                    self.search(query: query)
                
            }
            .store(in: &cancellables)
    }
    

    private func search(query: String) {
        print("Searching for \(query)")
        if(query.isEmpty) {
            searchResults = []
            return
        }
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.pointOfInterestFilter = .includingAll
        request.resultTypes = .pointOfInterest

        let search = MKLocalSearch(request: request)
        search.start {
            response,
            error in
            guard let response = response else {
                print("Error: \(error ?? NSError())")
                return
            }
            self.searchResults = response.mapItems.map { item in
                LocationData(
                    latitude: item.placemark.coordinate.latitude,
                    longitude: item.placemark.coordinate.longitude,
                    name: item.name ?? "Unknown"
                )
            }
        }
    }
}
